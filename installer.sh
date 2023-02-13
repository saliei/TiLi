#!/usr/bin/env bash
#
# An interactive installation script written using dialog program. 
# This script is mainly for Arch Linux, but can be configured for 
# other distributions, e.g. Void Linux.
# 
# TODO: check if current distro is supported
# TODO: --config-only, just for ricing up, not for a full install
# TODO: option to install multiple kernels with a convenient script to change between them
# TODO: Bug: CTRL-Z hangs instead of being trapped
# TODO: put all vars inside curly braces

CURDIR="$(dirname "$0")"
INCDIR="${CURDIR}/include"

MENU_INPUT="$(mktemp -t tili_menu.XXXXX || exit 1)"

source "${INCDIR}/args.sh"

# TODO: bug free method for adding more signals
trap "DIE" SIGINT  # CTRL+C
trap "DIE" SIGQUIT # CTRL+Z
trap "DIE" SIGTSTP # ESC

function DIE() {
    echo "the DIE function"
    exit 1
}

function DIALOG() {
    dialog --keep-tite --no-shadow --colors --backtitle "TiLi - The Interavtive Linux Installer" \
        --cancel-label "Back" --aspect 20 "$@"
}

function detect_distro() {
    [ -z "$DISTRO" ] && DISTRO="Arch Linux"
}

function detect_EFI() {
    EFI_SYSTEM=0
    if [ -e /sys/firmware/efi/systab ]; then
        EFI_SYSTEM=1
        EFI_FW_SIZE=$(<"/sys/firmware/efi/fw_platform_size")
        if [ "$EFI_FW_SIZE" -eq 32 ]; then
            EFI_TARGET=i386-efi
        else
            EFI_TARGET=x86_64-efi
        fi
    fi
}

function welcome_message() {
    DIALOG --title "[T i L i]" --yes-label "Continue" --no-label "Cancel" \
        --yesno "TiLi is an interactive ${BBOLD}GNU/Linux${RESET} installer script, \
        inspired by Slackware and Void Linux installers, currently speciliazed on Arch Linux. \
        The aim is to automate most common tasks during installing Linux distributions \
        and also provide a ${BBOLD}minimalistic${RESET} and ${BBOLD}clean${RESET} \
        set of configurations and an opinionated development environment which obviously \
        can be customized or skipped entirely."  $YESNO_SIZE
    
    case $? in 
        0)
            return 0
            ;;
        1)
            exit 1
            ;;
        255)
            # TODO: trap ESC signal
            exit 255
            ;;
    esac
}


function keymap_menu() {
    echo "setup keymap"
    KEYMAP_DONE=1
}

function network_menu() {
    echo "select network"
    NETWORK_DONE=1
}

function hostname_menu() {
    echo "setup hostname"
    HOSTNAME_DONE=1
}

function installation_menu() {
    [ -z "$DEFAULT_MENU_ITEM" ] && DEFAULT_MENU_ITEM="Keyboard"

    DIALOG --default-item "$DEFAULT_MENU_ITEM" \
        --extra-button --extra-label "Settings" \
        --title "$DISTRO installation menu" \
        --menu "$MENU_LABEL" $MENU_SIZE \
        "Keyboard" "Set system keyboard" \
        "Network"  "Set up the network" \
        "Hostname" "Set up the system hostname" \
        "Exit"     "Exit the installation script" 2>"${MENU_INPUT}"

    MENU_ITEM=$(<"${MENU_INPUT}")

    case "${MENU_ITEM}" in 
        "Keyboard")
            keymap_menu
            [ -n $KEYMAP_DONE ]   && DEFAULT_MENU_ITEM="Network"
            ;;
        "Network")
            network_menu
            [ -n $NETWORK_DONE ]  && DEFAULT_MENU_ITEM="Hostname"
            ;;
        "Hostname")
            hostname_menu
            [ -n $HOSTNAME_DONE ] && DEFAULT_MENU_ITEM="Exit"
            ;;
        "Exit")
            DIE
            ;;
    esac

}

function main() {
    welcome_message

    detect_distro
    echo $DISTRO

    detect_EFI
    echo $EFI_TARGET

    while true; do
        installation_menu
    done

}

main "$@"

