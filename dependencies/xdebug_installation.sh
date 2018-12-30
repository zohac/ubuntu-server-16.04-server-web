#!/bin/bash
# Version 0.1

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
NORMAL="\e[39m"

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

sudo pecl install xdebug

# setup Xdebug
sudo -s <<eof
 echo '
xdebug.show_error_trace = 1
' >> /etc/php/7.1/mods-available/xdebug.ini
eof

sudo -s <<eof
echo '
;;;;;;;;;;;;;;;;;;;;
;      xdebug      ;
;;;;;;;;;;;;;;;;;;;;
zend_extension="/usr/lib/php/20160303/xdebug.so"

xdebug.remote_enable = On
' >> /etc/php/7.1/apache2/php.ini
eof

sudo -s <<eof
echo '
;;;;;;;;;;;;;;;;;;;;
;      xdebug      ;
;;;;;;;;;;;;;;;;;;;;
zend_extension="/usr/lib/php/20160303/xdebug.so"

xdebug.remote_enable = On
' >> /etc/php/7.1/cli/php.ini
eof

sudo service apache2 restart
