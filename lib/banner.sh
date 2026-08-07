#!/usr/bin/env bash

banner() {

    clear

    echo -e "${CYAN}"

    separator

    cat << "EOF"

███╗   ██╗███████╗██╗
████╗  ██║╚══███╔╝██║
██╔██╗ ██║  ███╔╝ ██║
██║╚██╗██║ ███╔╝  ██║
██║ ╚████║███████╗██║
╚═╝  ╚═══╝╚══════╝╚═╝

           Nevolus Zabbix Installer

                 NZI v1.0.0

EOF

    separator

    echo -e "${WHITE} Autor........ ${SCRIPT_AUTHOR}${RESET}"
    echo -e "${WHITE} Empresa...... ${SCRIPT_COMPANY}${RESET}"
    echo -e "${WHITE} Projeto...... NZI${RESET}"

    line

    echo

}