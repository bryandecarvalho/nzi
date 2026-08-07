#!/usr/bin/env bash

########################################
# Verifica se o repositório está instalado
########################################

repository_installed() {

    case "${PACKAGE_MANAGER}" in

        dnf)

            rpm -q zabbix-release &>/dev/null

        ;;

        apt)

            dpkg -s zabbix-release &>/dev/null

        ;;

        *)

            return 1

        ;;

    esac

}

########################################
# Verifica se o Agent2 está instalado
########################################

agent_installed() {

    case "${PACKAGE_MANAGER}" in

        dnf)

            rpm -q zabbix-agent2 &>/dev/null

        ;;

        apt)

            dpkg -s zabbix-agent2 &>/dev/null

        ;;

        *)

            return 1

        ;;

    esac

}

########################################
# Instala o repositório do Zabbix
########################################

install_repository() {

    info "Instalando repositório do Zabbix..."

    if repository_installed; then
        success "Repositório do Zabbix já está instalado."
        return
    fi

    case "${OS}" in

        AlmaLinux)

            rpm -Uvh \
            "https://repo.zabbix.com/zabbix/${ZABBIX_VERSION}/release/alma/${OS_MAJOR_VERSION}/noarch/zabbix-release-latest-${ZABBIX_VERSION}.el${OS_MAJOR_VERSION}.noarch.rpm"

            dnf clean all

        ;;

        Ubuntu)

            wget -q \
            "https://repo.zabbix.com/zabbix/${ZABBIX_VERSION}/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest+ubuntu${OS_VERSION}_all.deb"

            dpkg -i \
            "zabbix-release_latest+ubuntu${OS_VERSION}_all.deb"

            apt update

        ;;

        Debian)

            wget -q \
            "https://repo.zabbix.com/zabbix/${ZABBIX_VERSION}/release/debian/pool/main/z/zabbix-release/zabbix-release_latest+debian${OS_VERSION}_all.deb"

            dpkg -i \
            "zabbix-release_latest+debian${OS_VERSION}_all.deb"

            apt update

        ;;

        *)

            error "Sistema operacional não suportado."

        ;;

    esac

    success "Repositório instalado com sucesso."

}

########################################
# Instala o Zabbix Agent2
########################################

install_agent() {

    info "Instalando Zabbix Agent2..."

    if agent_installed; then
        success "Zabbix Agent2 já está instalado."
        return
    fi

    case "${PACKAGE_MANAGER}" in

        dnf)

            dnf install -y zabbix-agent2

        ;;

        apt)

            apt update

            apt install -y zabbix-agent2

        ;;

        *)

            error "Gerenciador de pacotes não suportado."

        ;;

    esac

    success "Zabbix Agent2 instalado."

}