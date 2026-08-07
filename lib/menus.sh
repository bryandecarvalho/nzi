select_install_mode() {

    echo
    echo "=============================================================="
    echo "Modo de Instalação"
    echo "=============================================================="
    echo

    echo "[1] Completa (Recomendado)"
    echo
    echo "     - Instala Agent2"
    echo "     - Instala todos os plugins"
    echo "     - Configuração automática"
    echo "     - Firewall"
    echo

    echo "[2] Personalizada"
    echo

    echo "[0] Sair"
    echo

    read -rp "Digite a opção: " OPTION

    case "$OPTION" in

        1)

            INSTALL_MODE="Completa"

        ;;

        2)

            INSTALL_MODE="Personalizada"

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