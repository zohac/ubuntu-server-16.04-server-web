#!/bin/bash
# Version 0.1

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NORMAL="\e[39m"

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
source dependencies/update.sh

#
# Installation dependencies
#
source dependencies/dependencies_installation.sh

#
# Installation apache2
#
source dependencies/apache2_installation.sh

#
# Installation MySQL
#
source dependencies/mysql_installation.sh

#
# Installation php7.1
#
source dependencies/php7.3_installation.sh

#
# Installation de xdebug
#
source dependencies/xdebug_installation.sh

#
# Composer
#
source dependencies/composer_installation.sh

#
# PHP-CS-FIXER
#
source dependencies/php-cs-fixer_installation.sh

#
# PHP code sniffer
#
source dependencies/php-code-sniffer_installation.sh

#
# PHP Mess Detector
#
source dependencies/php-mess-detector_installation.sh

#
# PHP Copy/Paste Detector (PHPCPD)
#
source dependencies/copy-paste-detector_installation.sh

#
# Installation de samba
#
source dependencies/samba_installation.sh

#
# Installation of Blackfire
#
source dependencies/blackFire_installation.sh

#
# Shell custom
#
source dependencies/zsh_installation.sh

#
# Cleaning after installation
#
source dependencies/cleaning.sh

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

    read -p "You should restart [Y/n] ? " RESPONSE

    case $RESPONSE in
        N|n)
            echo -e "$YELLOW"
            echo "Remember to restart !"
            echo -e "$NORMAL"
            break
        ;;
        Y|y)
            #Redémarrage
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
