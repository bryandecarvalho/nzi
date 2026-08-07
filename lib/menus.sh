#!/usr/bin/env bash

OS=""
VERSION=""
PACKAGE_MANAGER=""

select_os() {

    echo "Escolha o Sistema Operacional"
    echo

    echo "1) AlmaLinux 8"
    echo "2) AlmaLinux 9"
    echo "3) AlmaLinux 10"

    echo

    echo "4) Ubuntu 22.04"
    echo "5) Ubuntu 24.04"

    echo

    echo "6) Debian 11"
    echo "7) Debian 12"

    echo
    echo "0) Sair"
    echo

    read -rp "Digite a opção: " OPTION

    case "$OPTION" in

        1)
            OS="AlmaLinux"
            VERSION="8"
            PACKAGE_MANAGER="dnf"
        ;;

        2)
            OS="AlmaLinux"
            VERSION="9"
            PACKAGE_MANAGER="dnf"
        ;;

        3)
            OS="AlmaLinux"
            VERSION="10"
            PACKAGE_MANAGER="dnf"
        ;;

        4)
            OS="Ubuntu"
            VERSION="22.04"
            PACKAGE_MANAGER="apt"
        ;;

        5)
            OS="Ubuntu"
            VERSION="24.04"
            PACKAGE_MANAGER="apt"
        ;;

        6)
            OS="Debian"
            VERSION="11"
            PACKAGE_MANAGER="apt"
        ;;

        7)
            OS="Debian"
            VERSION="12"
            PACKAGE_MANAGER="apt"
        ;;

        0)
            exit 0
        ;;

        *)
            echo
            echo "Opção inválida."
            exit 1
        ;;

    esac

}