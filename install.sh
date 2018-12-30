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
            echo -e "$YELLOW"
            echo "Les paramètres autorisés sont Y|y|N|n."
            echo -e "$NORMAL"
            exit 0;
        ;;
    esac

fi

echo -e "$GREEN"
echo '  _       __     __                         '
echo ' | |     / /__  / /________  ____ ___  ___  '
echo ' | | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \ '
echo ' | |/ |/ /  __/ / /__/ /_/ / / / / / /  __/ '
echo ' |__/|__/\___/_/\___/\____/_/ /_/ /_/\___/  '
echo ''
echo 'Installing Apache2/PHP7.3/MySQL for a development web server on ubuntu server 18.04.'
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

echo -e "$GREEN"
echo ' _____         __                    '
echo '/__  /  ____  / /_  ____ ______      '
echo '  / /  / __ \/ __ \/ __ `/ ___/      '
echo ' / /__/ /_/ / / / / /_/ / /__        '
echo '/____/\____/_/ /_/\__,_/\___/  web server installation script...is now installed!'
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
            echo -e "$YELLOW"
            echo "Remember to restart !"
            echo -e "$NORMAL"
            break
        ;;
        Y|y)
            #Reboot
            sudo reboot
            break
        ;;
        *)
            echo -e "$RED"
            echo "Error, you had to answer yes[Y] or no[n]."
            echo -e "$NORMAL"
        ;;
    esac

done

exit 0;
