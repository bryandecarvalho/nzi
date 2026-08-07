#!/usr/bin/env bash

###############################################################################
#
# Nevolus Zabbix Installer (NZI)
#
# Autor....: Bryan Carvalho
# Empresa..: Nevolus
#
###############################################################################

set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

########################################
# Carrega Configuração
########################################

source "${BASE_DIR}/conf/config.sh"

########################################
# Carrega Bibliotecas
########################################

source "${BASE_DIR}/lib/colors.sh"
source "${BASE_DIR}/lib/functions.sh"
source "${BASE_DIR}/lib/banner.sh"
source "${BASE_DIR}/lib/menus.sh"
source "${BASE_DIR}/lib/installer.sh"
source "${BASE_DIR}/lib/plugins.sh"
source "${BASE_DIR}/lib/configure.sh"
source "${BASE_DIR}/lib/firewall.sh"
source "${BASE_DIR}/lib/service.sh"
source "${BASE_DIR}/lib/summary.sh"

########################################
# Programa Principal
########################################

main() {

    check_root

    banner

    detect_os

    echo
    read -rp "Continuar com ${OS} ${OS_VERSION}? (S/N): " RESP

    if [[ ! "${RESP^^}" =~ ^S$ ]]; then
        warning "Instalação cancelada pelo usuário."
        exit 0
    fi

    select_install_mode

    ask_hostname

    show_summary

    pause

    select_zabbix_version
    
    ####################################
    # Instalação
    ####################################

    install_repository

    install_agent

    install_plugins

    configure_agent

    configure_firewall

    start_service

    ####################################
    # Finalização
    ####################################

    final_summary

}

main "$@"