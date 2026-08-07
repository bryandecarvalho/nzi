#!/usr/bin/env bash

###############################################################################
#
# Nevolus Zabbix Installer (NZI)
#
# Autor....: Bryan Carvalho
# Empresa..: Nevolus
#
###############################################################################

########################################
# Informações do Script
########################################

readonly SCRIPT_NAME="Nevolus Zabbix Installer"
readonly SCRIPT_VERSION="1.0.0"

readonly SCRIPT_AUTHOR="Bryan Carvalho"
readonly SCRIPT_COMPANY="Nevolus"

readonly SCRIPT_DOMAIN="monitoramento.centralserver.com.br"

########################################
# Configuração do Zabbix
########################################

#
# Versão padrão do Zabbix (EL8+, Ubuntu e Debian)
#

readonly DEFAULT_ZABBIX_VERSION="7.4"

#
# Será definida automaticamente pelo instalador
#

ZABBIX_VERSION=""

readonly ZABBIX_SERVER="node01.centralserver.com.br,node02.centralserver.com.br"

########################################
# Variáveis de Execução
########################################

OS=""
OS_VERSION=""
OS_MAJOR_VERSION=""
PACKAGE_MANAGER=""
INSTALL_MODE=""
HOSTNAME_ZABBIX=""