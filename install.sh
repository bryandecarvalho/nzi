#!/usr/bin/env bash

set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

source "${BASE_DIR}/conf/config.sh"

source "${BASE_DIR}/lib/colors.sh"
source "${BASE_DIR}/lib/functions.sh"
source "${BASE_DIR}/lib/banner.sh"
source "${BASE_DIR}/lib/menus.sh"

main() {

    check_root

    banner

    select_os

    echo
    echo "Sistema selecionado"
    echo
    echo "Distribuição : ${OS}"
    echo "Versão       : ${VERSION}"
    echo "Pacotes      : ${PACKAGE_MANAGER}"
    echo

}

main "$@"