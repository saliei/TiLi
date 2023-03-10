# various arguments and definitions

DIALOG="/usr/bin/dialog"
CFDISK="/usr/bin/cfdisk"
CGDISK="/usr/bin/cgdisk"
DHCPCD="/usr/sbin/dhcpcd"

#export DIALOG_ESC=1
#export DIALOG_EXTRA=255
# TODO: maybe a better way to export this
export DIALOGRC="$PWD/dialogrc"

# TODO: a more general way to set editor, see if there are any other editors, etc.
export EDITOR=${EDITOR:vim}

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
INPUT_SIZE="10 80"
MSGBOX_SIZE="10 70"
MENU_SIZE="14 60 0"
YESNO_SIZE="$INPUT_SIZE"
WIDGET_SIZE="10 70"
MENU_LABEL="Use ${BOLD}UP${RESET} and ${BOLD}DOWN${RESET} keys to navigate menus. \
    Use ${BOLD}TAB${RESET} to switch between buttons and ${BOLD}ENTER${RESET} to select."

