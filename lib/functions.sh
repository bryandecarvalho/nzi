#!/usr/bin/env bash

########################################
# Verifica Root
########################################

check_root() {

    if [[ $EUID -ne 0 ]]; then

        echo
        echo -e "${RED}Este instalador deve ser executado como root.${RESET}"
        echo

        exit 1

    fi

}

########################################
# Separador Principal
########################################

separator() {

    printf '%*s\n' 66 '' | tr ' ' '═'

}

########################################
# Linha Secundária
########################################

line() {

    printf '%*s\n' 66 '' | tr ' ' '─'

}

########################################
# Título
########################################

title() {

    echo
    separator
    echo "▶ $1"
    separator
    echo

}

########################################
# Campo formatado
########################################

print_field() {

    printf " ✔ %-20s %s\n" "$1" "$2"

}

########################################
# Pausa
########################################

pause() {

    echo
    read -rp "Pressione ENTER para continuar..."

}

########################################
# Mensagens
########################################

info() {

    echo -e "${BLUE}[INFO]${RESET} $1"

}

success() {

    echo -e "${GREEN}[ OK ]${RESET} $1"

}

warning() {

    echo -e "${YELLOW}[WARN]${RESET} $1"

}

error() {

    echo
    echo -e "${RED}[ERRO]${RESET} $1"
    echo

    exit 1

}

########################################
# Carrega Bibliotecas
########################################

load_library() {

    local FILE="$1"

    if [[ ! -f "${FILE}" ]]; then
        error "Biblioteca não encontrada: ${FILE}"
    fi

    # shellcheck source=/dev/null
    source "${FILE}"

}