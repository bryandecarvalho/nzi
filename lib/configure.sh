#!/usr/bin/env bash

########################################
# Configuração do Zabbix Agent2
########################################

configure_agent() {

    info "Configurando Zabbix Agent2..."

    ####################################
    # Descobre hostname
    ####################################

    HOSTNAME="$(hostname -f 2>/dev/null || hostname)"

    ####################################
    # Caminho do arquivo
    ####################################

    if [[ -f /etc/zabbix/zabbix_agent2.conf ]]; then

        CONF="/etc/zabbix/zabbix_agent2.conf"

    elif [[ -f /etc/zabbix/zabbix_agentd.conf ]]; then

        CONF="/etc/zabbix/zabbix_agentd.conf"

    else

        error "Arquivo de configuração do Zabbix não encontrado."

    fi

    ####################################
    # Backup
    ####################################

    cp "${CONF}" "${CONF}.bak.$(date +%F_%H%M%S)"

    ####################################
    # Hostname
    ####################################

    sed -i "s/^Hostname=.*/Hostname=${HOSTNAME}/" "${CONF}"

    ####################################
    # Server
    ####################################

    sed -i "s/^Server=.*/Server=${ZABBIX_SERVER}/" "${CONF}"

    ####################################
    # ServerActive
    ####################################

    sed -i "s/^ServerActive=.*/ServerActive=${ZABBIX_SERVER}/" "${CONF}"

    success "Arquivo configurado."

}