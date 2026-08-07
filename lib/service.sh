#!/usr/bin/env bash

########################################
# Inicialização do Serviço
########################################

start_service() {

    info "Inicializando Zabbix Agent2..."

    #
    # Recarrega o systemd
    #

    systemctl daemon-reload

    #
    # Habilita na inicialização
    #

    systemctl enable zabbix-agent2 >/dev/null

    #
    # Reinicia o serviço
    #

    systemctl restart zabbix-agent2

    #
    # Verifica se iniciou
    #

    if systemctl is-active --quiet zabbix-agent2; then

        success "Serviço iniciado com sucesso."

    else

        error "Não foi possível iniciar o serviço Zabbix Agent2."

    fi

}