#!/usr/bin/env bash

########################################
# Resumo Final
########################################

final_summary() {

    clear
    banner

    title "Instalação Concluída"

    #
    # Status do Serviço
    #

    if systemctl is-active --quiet zabbix-agent2; then
        SERVICE_STATUS="Ativo"
    else
        SERVICE_STATUS="Inativo"
    fi

    #
    # Exibe Resumo
    #

    print_field "Sistema" "${OS} ${OS_VERSION}"
    print_field "Hostname" "${HOSTNAME_ZABBIX}"
    print_field "Versão Zabbix" "${ZABBIX_VERSION}"
    print_field "Modo" "${INSTALL_MODE}"
    print_field "Serviço" "${SERVICE_STATUS}"

    echo
    line
    echo

    if [[ "${SERVICE_STATUS}" == "Ativo" ]]; then

        success "Instalação  com sucesso."

    else

        warning "Instalação concluída, porém o serviço não está ativo."

    fi

    echo
    echo "Obrigado por utilizar o ${SCRIPT_NAME}."
    echo "Desenvolvido por ${SCRIPT_COMPANY}."
    echo

}