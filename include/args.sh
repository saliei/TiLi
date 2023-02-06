# various arguments and definitions

DIALOG="/usr/bin/dialog"
CFDISK="/usr/bin/cfdisk"
CGDISK="/usr/bin/cgdisk"
DHCPCD="/usr/sbin/dhcpcd"

export DIALOG_ESC=1
export DIALOG_EXTRA=255
export DIALOG_OPTS="--keep-tite --colors \
    --backtitle \"The Interactive Linux Installer\" --cancel-label \"Back\""

# hardcoded color codes,
# also `tput setaf` can be used for a more dynamic version of color codes, 
# e.g. BLACK=$(tput setaf 30)
BLACK="\e[0;90m"
RED="\e[0;91m"
GREEN="\e[0;92m"
BROWN="\e[0;93m"
BLUE="\e[0;94m"
PURPLE="\e[0;95m"
CYAN="\e[0;96m"
GREY="\e[0;97m"
BOLD="\e[1m"
ULINE="\e[4m"
EXPANDBG="\e[K"
BLUEBG="\e[0;104m"
BLUEBG_EXPAND="${BLUEBG}${EXPANDBG}"
RESET="\e[0m"

# dialog sizes
INPUT_SIZE="8 60"
MSGBOX_SIZE="8 70"
MENU_SIZE="14 60 0"
YESNO_SIZE="$INPUTSIZE"
WIDGET_SIZE="10 70"
MENU_LABEL="Use ${BOLD}UP${RESET} and ${BOLD}DOWN${RESET} keys to navigate menus. \
    Use ${BOLD}TAB${RESET} to switch between buttons and ${BOLD}ENTER${RESET} to select."
