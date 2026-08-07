#!/usr/bin/env bash

########################################
# Seleciona automaticamente a versão
# do Zabbix conforme o Sistema Operacional
########################################

select_zabbix_version() {

    case "${OS}" in

        "CloudLinux"|"CentOS")

            if [[ "${OS_MAJOR_VERSION}" == "7" ]]; then
                ZABBIX_VERSION="6.0"
            else
                ZABBIX_VERSION="${DEFAULT_ZABBIX_VERSION}"
            fi
            ;;

        *)

            ZABBIX_VERSION="${DEFAULT_ZABBIX_VERSION}"
            ;;

    esac

    info "Versão do Zabbix: ${ZABBIX_VERSION}"

}

########################################
# Instala Repositório do Zabbix
########################################

install_repository() {

    info "Instalando repositório do Zabbix..."

    local REPO_URL=""

    case "${OS}" in

        "AlmaLinux")

            REPO_URL="https://repo.zabbix.com/zabbix/${ZABBIX_VERSION}/release/alma/${OS_MAJOR_VERSION}/noarch/zabbix-release-latest-${ZABBIX_VERSION}.el${OS_MAJOR_VERSION}.noarch.rpm"
            ;;

        "Rocky Linux"|"Red Hat Enterprise Linux"|"Oracle Linux")

            REPO_URL="https://repo.zabbix.com/zabbix/${ZABBIX_VERSION}/rhel/${OS_MAJOR_VERSION}/x86_64/zabbix-release-latest-${ZABBIX_VERSION}.el${OS_MAJOR_VERSION}.noarch.rpm"
            ;;

        "CloudLinux")

            REPO_URL="https://repo.zabbix.com/zabbix/${ZABBIX_VERSION}/rhel/${OS_MAJOR_VERSION}/x86_64/zabbix-release-latest-${ZABBIX_VERSION}.el${OS_MAJOR_VERSION}.noarch.rpm"
            ;;

        "CentOS")

            REPO_URL="https://repo.zabbix.com/zabbix/${ZABBIX_VERSION}/rhel/${OS_MAJOR_VERSION}/x86_64/zabbix-release-latest-${ZABBIX_VERSION}.el${OS_MAJOR_VERSION}.noarch.rpm"
            ;;

        "Ubuntu")

            curl -fsSL \
            "https://repo.zabbix.com/zabbix/${ZABBIX_VERSION}/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest+ubuntu${OS_VERSION}_all.deb" \
            -o /tmp/zabbix-release.deb

            dpkg -i /tmp/zabbix-release.deb

            apt update

            success "Repositório instalado."

            return
            ;;

        "Debian")

            curl -fsSL \
            "https://repo.zabbix.com/zabbix/${ZABBIX_VERSION}/release/debian/pool/main/z/zabbix-release/zabbix-release_latest+debian${OS_MAJOR_VERSION}_all.deb" \
            -o /tmp/zabbix-release.deb

            dpkg -i /tmp/zabbix-release.deb

            apt update

            success "Repositório instalado."

            return
            ;;

        *)

            error "Sistema operacional não suportado."
            ;;

    esac

    info "URL: ${REPO_URL}"

    rpm -Uvh "${REPO_URL}"

    case "${PACKAGE_MANAGER}" in

        dnf)

            dnf clean all
            ;;

        yum)

            yum clean all
            ;;

    esac

    success "Repositório instalado."

}

########################################
# Instala Zabbix Agent2
########################################

install_agent() {

    info "Instalando Zabbix Agent2..."

    case "${PACKAGE_MANAGER}" in

        dnf)

            dnf install -y zabbix-agent2
            ;;

        yum)

            yum install -y zabbix-agent2
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