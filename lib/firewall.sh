#!/usr/bin/env bash

########################################
# Configuração do Firewall
########################################

configure_firewall() {

    info "Configurando Firewall..."

    ####################################
    # firewalld
    ####################################

    if command -v firewall-cmd &>/dev/null; then

        if systemctl is-active --quiet firewalld; then

            if firewall-cmd --list-ports | grep -qw "10050/tcp"; then

                success "Porta 10050/TCP já liberada no firewalld."

            else

                firewall-cmd --permanent --add-port=10050/tcp >/dev/null
                firewall-cmd --reload >/dev/null

                success "Porta 10050/TCP liberada no firewalld."

            fi

            return

        else

            warning "firewalld instalado, porém inativo."

        fi

    fi

    ####################################
    # UFW
    ####################################

    if command -v ufw &>/dev/null; then

        if ufw status | grep -qi "Status: active"; then

            if ufw status | grep -q "10050/tcp"; then

                success "Porta 10050/TCP já liberada no UFW."

            else

                ufw allow 10050/tcp >/dev/null

                success "Porta 10050/TCP liberada no UFW."

            fi

            return

        else

            warning "UFW instalado, porém inativo."

        fi

    fi

    ####################################
    # Nenhum firewall encontrado
    ####################################

    warning "Nenhum firewall ativo encontrado. Etapa ignorada."

}