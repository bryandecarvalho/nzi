#!/usr/bin/env bash

########################################
# Seleciona automaticamente a versão
# do Zabbix
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
# Obtém URL do repositório
########################################

get_repository_url() {

    local KEY

    case "${OS}" in

        "AlmaLinux")

            KEY="almalinux:${OS_MAJOR_VERSION}"
            ;;

        "Rocky Linux")

            KEY="rocky:${OS_MAJOR_VERSION}"
            ;;

        "Red Hat Enterprise Linux")

            KEY="rhel:${OS_MAJOR_VERSION}"
            ;;

        "Oracle Linux")

            KEY="oracle:${OS_MAJOR_VERSION}"
            ;;

        "CloudLinux")

            KEY="cloudlinux:${OS_MAJOR_VERSION}"
            ;;

        "CentOS")

            KEY="centos:${OS_MAJOR_VERSION}"
            ;;

        "Ubuntu")

            KEY="ubuntu:${OS_VERSION}"
            ;;

        "Debian")

            KEY="debian:${OS_MAJOR_VERSION}"
            ;;

        *)

            error "Sistema operacional não suportado."
            ;;

    esac

    REPO_URL="${ZABBIX_REPOS[$KEY]}"

    if [[ -z "${REPO_URL}" ]]; then
        error "Não existe um repositório cadastrado para ${KEY}"
    fi

}

########################################
# Instala Repositório
########################################

install_repository() {

    info "Instalando repositório do Zabbix..."

    get_repository_url

    info "URL: ${REPO_URL}"

    ####################################
    # Validação
    ####################################

    if ! curl --silent --head --fail "${REPO_URL}" >/dev/null; then

        error "Repositório indisponível:

${REPO_URL}"

    fi

    ####################################
    # RPM
    ####################################

    case "${PACKAGE_MANAGER}" in

        dnf|yum)

            rpm -Uvh "${REPO_URL}"

            if command -v dnf >/dev/null 2>&1; then
                dnf clean all
            else
                yum clean all
            fi

            ;;

        apt)

            curl -fsSL "${REPO_URL}" \
                -o /tmp/zabbix-release.deb

            dpkg -i /tmp/zabbix-release.deb

            apt update

            ;;

    esac

    success "Repositório instalado."

}

########################################
# Instala Agent2
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