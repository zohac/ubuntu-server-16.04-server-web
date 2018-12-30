#!/bin/bash
# Version 0.1

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
NORMAL="\e[39m"

FULL_DIR=$PWD'/'`dirname $0`

# Retrieving parameters
RESPONSE=''
if [ "$1" ]; then

    case "$1" in
        Y|y|N|n)
            RESPONSE="$1"
        ;;
        *)
            echo -e "$YELLOW"'Les paramètres autorisés sont Y|y|N|n.'"$NORMAL"
            exit 1;
        ;;
    esac

fi

echo -e "$GREEN"'  _       __     __                         '
echo -e "$GREEN"' | |     / /__  / /________  ____ ___  ___  '
echo -e "$GREEN"' | | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \ '
echo -e "$GREEN"' | |/ |/ /  __/ / /__/ /_/ / / / / / /  __/ '
echo -e "$GREEN"' |__/|__/\___/_/\___/\____/_/ /_/ /_/\___/  '
echo ''
echo -e "$GREEN"'Installing Apache2/PHP7.3/MySQL for a development web server on ubuntu server 18.04.'
echo ''
echo ''
echo -e "$NORMAL"

DEPENDENCIES=(
    "update.sh"
    "dependencies_installation.sh"
    "apache2_installation.sh"
    "mysql_installation.sh"
    "php7.3_installation.sh"
    "xdebug_installation.sh"
    "composer_installation.sh"
    "php-cs-fixer_installation.sh"
    "php-code-sniffer_installation.sh"
    "php-mess-detector_installation.sh"
    "copy-paste-detector_installation.sh"
    "samba_installation.sh"
    "blackFire_installation.sh"
    "zsh_installation.sh"
    "cleaning.sh"
)

# get length of $distro array
length=${#DEPENDENCIES[@]}

# Use bash for loop
for (( i=0; i<$length; i++ ));
    do
        source "$FULL_DIR"/dependencies/"${DEPENDENCIES[$i]}" ;
    done

echo -e "$GREEN"' _____         __                    '
echo -e "$GREEN"'/__  /  ____  / /_  ____ ______      '
echo -e "$GREEN"'  / /  / __ \/ __ \/ __ `/ ___/      '
echo -e "$GREEN"' / /__/ /_/ / / / / /_/ / /__        '
echo -e "$GREEN"'/____/\____/_/ /_/\__,_/\___/  web server installation script...is now installed!'
echo ''
echo ''
echo -e "$NORMAL"

while :
do

    if [ "$RESPONSE" = '' ]; then
        read -p "You should restart [Y/n] ? " RESPONSE
    fi

    case "$RESPONSE" in
        N|n)
            echo -e "$YELLOW"'Remember to restart !'"$NORMAL"
            break
        ;;
        Y|y)
            #Reboot
            sudo reboot
            break
        ;;
        *)
            echo -e "$RED"'Error, you had to answer yes[Y] or no[n].'"$NORMAL"
        ;;
    esac

done

exit 0;
