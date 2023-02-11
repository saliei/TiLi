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

CURDIR="$(dirname "$0")"
INCDIR="${CURDIR}/include"


#ANSWER="$(mktemp -t tili.XXXXX || exit 1)"

source "${INCDIR}/args.sh"

trap "DIE" SIGINT SIGQUIT SIGTERM SIGTSTP

function DIE() {
    echo "the DIE function"
    exit 1
}

function DIALOG() {
    dialog --keep-tite --no-shadow --colors --backtitle "TiLi - The Interavtive Linux Installer" \
        --cancel-label "Back" --aspect 20 "$@"
}

function welcome_message() {
    DIALOG --title "TiLi" --yes-label "Continue" --no-label "Back" \
        --yesno "TiLi is an interactive ${BBOLD}GNU/Linux${RESET} installer script, \
        inspired by Slackware and Void Linux installers. The aim is to automate most \
        common tasks during installing Linux distributions and also provide a \
        ${BBOLD}minimalistic${RESET} and ${BBOLD}clean${RESET} set of configurations \
        and an opinionated development environment which obviously can be customized or \
        skipped entirely."  $YESNO_SIZE
    
    case $? in 
        0)
            echo "continue"
            ;;
        1)
            echo "cancel"
            ;;
        255)
            echo "dying"
            ;;
    esac
}

function main() {
    welcome_message
}

main "$@"

