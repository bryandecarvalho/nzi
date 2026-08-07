#!/usr/bin/env bash

check_root() {

    if [[ $EUID -ne 0 ]]; then
        echo
        echo -e "${RED}Execute este instalador como root.${RESET}"
        echo
        exit 1
    fi

}