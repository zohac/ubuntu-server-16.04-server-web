#!/bin/bash
# Version 0.1

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NORMAL="\e[39m"
CURRENT_DIR=$PWD'/'`dirname $0`

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

#
# Update the server
#
source "$CURRENT_DIR"/dependencies/update.sh $ARTIFACT_VERSION
exit_state_1=$?

#
# Installation dependencies
#
source "$CURRENT_DIR"/dependencies/dependencies_installation.sh $ARTIFACT_VERSION
exit_state_2=$?

#
# Installation apache2
#
source "$CURRENT_DIR"/dependencies/apache2_installation.sh $ARTIFACT_VERSION
exit_state_3=$?

#
# Installation MySQL
#
source "$CURRENT_DIR"/dependencies/mysql_installation.sh $ARTIFACT_VERSION
exit_state_4=$?

#
# Installation php7.1
#
source "$CURRENT_DIR"/dependencies/php7.3_installation.sh $ARTIFACT_VERSION
exit_state_5=$?

#
# Installation de xdebug
#
source "$CURRENT_DIR"/dependencies/xdebug_installation.sh $ARTIFACT_VERSION
exit_state_6=$?

#
# Composer
#
source "$CURRENT_DIR"/dependencies/composer_installation.sh $ARTIFACT_VERSION
exit_state_7=$?

#
# PHP-CS-FIXER
#
source "$CURRENT_DIR"/dependencies/php-cs-fixer_installation.sh $ARTIFACT_VERSION
exit_state_8=$?

#
# PHP code sniffer
#
source "$CURRENT_DIR"/dependencies/php-code-sniffer_installation.sh $ARTIFACT_VERSION
exit_state_9=$?

#
# PHP Mess Detector
#
source "$CURRENT_DIR"/dependencies/php-mess-detector_installation.sh $ARTIFACT_VERSION
exit_state_10=$?

#
# PHP Copy/Paste Detector (PHPCPD)
#
source "$CURRENT_DIR"/dependencies/copy-paste-detector_installation.sh $ARTIFACT_VERSION
exit_state_11=$?

#
# Installation de samba
#
source "$CURRENT_DIR"/dependencies/samba_installation.sh $ARTIFACT_VERSION
exit_state_12=$?

#
# Installation of Blackfire
#
source "$CURRENT_DIR"/dependencies/blackFire_installation.sh $ARTIFACT_VERSION
exit_state_13=$?

#
# Shell custom
#
source "$CURRENT_DIR"/dependencies/zsh_installation.sh $ARTIFACT_VERSION
exit_state_14=$?

#
# Cleaning after installation
#
source "$CURRENT_DIR"/dependencies/cleaning.sh $ARTIFACT_VERSION
exit_state_15=$?

EXIT_STATUS=$[ $exit_state_1 &&  $exit_state_2 && $exit_state_3 &&  $exit_state_4 && $exit_state_5 &&  $exit_state_6 && $exit_state_7 &&  $exit_state_8 && $exit_state_9 &&  $exit_state_10 && $exit_state_11 &&  $exit_state_12 && $exit_state_13 &&  $exit_state_14 && $exit_state_15]

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

exit $EXIT_STATUS
