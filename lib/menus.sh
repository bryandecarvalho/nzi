#!/usr/bin/env bash

########################################
# Variáveis Globais
########################################

OS=""
OS_VERSION=""
OS_MAJOR_VERSION=""
PACKAGE_MANAGER=""
INSTALL_MODE=""
HOSTNAME_ZABBIX=""

########################################
# Detecta Sistema Operacional
########################################

detect_os() {

    info "Detectando sistema operacional..."

    if [[ ! -f /etc/os-release ]]; then
        error "Não foi possível detectar o sistema operacional."
    fi

    source /etc/os-release

    case "${ID}" in

        almalinux|rocky|rhel)

            OS="AlmaLinux"
            PACKAGE_MANAGER="dnf"
            ;;

        ubuntu)

            OS="Ubuntu"
            PACKAGE_MANAGER="apt"
            ;;

        debian)

            OS="Debian"
            PACKAGE_MANAGER="apt"
            ;;

        *)

            error "Sistema operacional não suportado: ${PRETTY_NAME}"
            ;;

    esac

    OS_VERSION="${VERSION_ID}"
    OS_MAJOR_VERSION="${VERSION_ID%%.*}"

    success "Sistema detectado: ${OS} ${OS_VERSION}"

}

########################################
# Seleção do Modo de Instalação
########################################

select_install_mode() {

    while true; do

        clear
        banner

        title "Modo de Instalação"

        echo "[1] Instalação Completa (Recomendado)"
        echo
        echo "    • Instala o Zabbix Agent2"
        echo "    • Instala todos os Plugins"
        echo "    • Configura automaticamente o Agent2"
        echo "    • Configura o Firewall"
        echo "    • Habilita e inicia o serviço"
        echo

        echo "[2] Ferramentas (Em breve)"
        echo
        echo "    • Reconfigurar Agent2"
        echo "    • Instalar Plugins"
        echo "    • Atualizar Agent2"
        echo "    • Configurar Firewall"
        echo "    • Reiniciar Serviço"
        echo

        echo "[0] Sair"
        echo

        read -rp "Digite a opção: " OPTION

        case "${OPTION}" in

            1)

                INSTALL_MODE="Completa"
                break
                ;;

            2)

                warning "O modo Ferramentas estará disponível na versão 1.1.0."

                sleep 2
                ;;

            0)

                clear
                exit 0
                ;;

            *)

                warning "Opção inválida."

                sleep 1
                ;;

        esac

    done

}

########################################
# Hostname
########################################

ask_hostname() {

    clear
    banner

    title "Hostname"

    HOSTNAME_ZABBIX="$(hostnamectl --static 2>/dev/null || hostname)"
    HOSTNAME_FQDN="$(hostname -f 2>/dev/null || echo "Não disponível")"

    echo "Hostname detectado : ${HOSTNAME_ZABBIX}"
    echo "FQDN              : ${HOSTNAME_FQDN}"
    echo

    while true; do

        read -rp "Utilizar este hostname? (S/N): " RESP

        case "${RESP^^}" in

            S)

                break
                ;;

            N)

                while true; do

                    read -rp "Digite o hostname desejado: " HOSTNAME_ZABBIX

                    if [[ -n "${HOSTNAME_ZABBIX}" ]]; then
                        break 2
                    fi

                    warning "O hostname não pode ficar vazio."

                done

                ;;

            *)

                warning "Opção inválida."
                ;;

        esac

    done

}

########################################
# Resumo
########################################

show_summary() {

    clear
    banner

    title "Resumo da Instalação"

    print_field "Sistema"       "${OS}"
    print_field "Versão"        "${OS_VERSION}"
    print_field "Gerenciador"   "${PACKAGE_MANAGER}"
    print_field "Hostname"      "${HOSTNAME_ZABBIX}"

    echo

}