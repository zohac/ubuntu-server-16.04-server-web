#!/bin/bash
# Version 0.1

#
# Installation de xdebug
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#           xdebug installation           #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$BLUE"'Installation of php-xdebug...'"$NORMAL"
sudo apt-get install php-xdebug

echo -e "$BLUE"'configuration of php xdebug on apache2...'"$NORMAL"
sudo -s <<eof

echo '

[XDebug]
xdebug.remote_enable = 1
xdebug.remote_autostart = 1' >> /etc/php/7.3/apache2/php.ini

eof
