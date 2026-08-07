#!/usr/bin/env bash

########################################
# Variáveis
########################################

INSTALL_POSTGRESQL=false
INSTALL_MYSQL=false
INSTALL_MONGODB=false
INSTALL_MSSQL=false
INSTALL_DOCKER=false

########################################
# Seleção de Plugins
########################################

select_plugins() {

    # Instalação completa
    if [[ "${INSTALL_MODE}" == "Completa" ]]; then

        INSTALL_POSTGRESQL=true
        INSTALL_MYSQL=true
        INSTALL_MONGODB=true
        INSTALL_MSSQL=true
        INSTALL_DOCKER=true

        info "Modo completo selecionado."
        return

    fi

    while true; do

        clear
        banner

        title "Plugins"

        echo "[1] PostgreSQL"
        echo "[2] MySQL"
        echo "[3] MongoDB"
        echo "[4] Microsoft SQL Server"
        echo "[5] Docker"
        echo
        echo "[6] Todos"
        echo
        echo "[0] Continuar"
        echo

        read -rp "Escolha uma opção: " OPTION

        case "${OPTION}" in

            1)
                INSTALL_POSTGRESQL=true
                success "Plugin PostgreSQL selecionado."
                sleep 1
            ;;

            2)
                INSTALL_MYSQL=true
                success "Plugin MySQL selecionado."
                sleep 1
            ;;

            3)
                INSTALL_MONGODB=true
                success "Plugin MongoDB selecionado."
                sleep 1
            ;;

            4)
                INSTALL_MSSQL=true
                success "Plugin MSSQL selecionado."
                sleep 1
            ;;

            5)
                INSTALL_DOCKER=true
                success "Plugin Docker selecionado."
                sleep 1
            ;;

            6)

                INSTALL_POSTGRESQL=true
                INSTALL_MYSQL=true
                INSTALL_MONGODB=true
                INSTALL_MSSQL=true
                INSTALL_DOCKER=true

                success "Todos os plugins selecionados."
                sleep 1

            ;;

            0)

                break

            ;;

            *)

                warning "Opção inválida."
                sleep 1

            ;;

        esac

    done

}

########################################
# Instala Plugins
########################################

install_plugins() {

    info "Instalando plugins..."

    case "${PACKAGE_MANAGER}" in

        dnf)

            ${INSTALL_POSTGRESQL} && dnf install -y zabbix-agent2-plugin-postgresql
            ${INSTALL_MYSQL}      && dnf install -y zabbix-agent2-plugin-mysql
            ${INSTALL_MONGODB}    && dnf install -y zabbix-agent2-plugin-mongodb
            ${INSTALL_MSSQL}      && dnf install -y zabbix-agent2-plugin-mssql
            ${INSTALL_DOCKER}     && dnf install -y zabbix-agent2-plugin-docker

        ;;

        apt)

            ${INSTALL_POSTGRESQL} && apt install -y zabbix-agent2-plugin-postgresql
            ${INSTALL_MYSQL}      && apt install -y zabbix-agent2-plugin-mysql
            ${INSTALL_MONGODB}    && apt install -y zabbix-agent2-plugin-mongodb
            ${INSTALL_MSSQL}      && apt install -y zabbix-agent2-plugin-mssql
            ${INSTALL_DOCKER}     && apt install -y zabbix-agent2-plugin-docker

        ;;

    esac

    success "Plugins instalados."

}