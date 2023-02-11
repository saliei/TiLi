# various arguments and definitions

DIALOG="/usr/bin/dialog"
CFDISK="/usr/bin/cfdisk"
CGDISK="/usr/bin/cgdisk"
DHCPCD="/usr/sbin/dhcpcd"

#export DIALOG_ESC=1
#export DIALOG_EXTRA=255
# TODO: maybe a better way to export this
export DIALOGRC="$PWD/dialogrc"

# color codes,
BLACK="\Z0"
RED="\Z1"
GREEN="\Z2"
YELLOW="\Z3"
BLUE="\Z4"
PURPLE="\Z5"
CYAN="\Z6"
GREY="\Z7"
BOLD="\Zb"
BBOLD=${BOLD}${BLUE}
ULINE="\Zu"
RESET="\Zn"

# dialog sizes
INPUT_SIZE="10 65"
MSGBOX_SIZE="10 70"
MENU_SIZE="14 60 0"
YESNO_SIZE="$INPUT_SIZE"
WIDGET_SIZE="10 70"
MENU_LABEL="Use ${BOLD}UP${RESET} and ${BOLD}DOWN${RESET} keys to navigate menus. \
    Use ${BOLD}TAB${RESET} to switch between buttons and ${BOLD}ENTER${RESET} to select."

function DIE() {
    echo "the DIE function"
    exit 1
}

function DIALOG() {
    dialog --keep-tite --no-shadow --colors --backtitle "TiLi - The Interavtive Linux Installer" \
        --cancel-label "Back" --aspect 20 "$@"
}
