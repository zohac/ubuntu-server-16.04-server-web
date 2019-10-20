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

sudo pecl install xdebug

# setup Xdebug
#sudo -s <<eof
# echo '
#xdebug.show_error_trace = 1
#' >> /etc/php/7.2/mods-available/xdebug.ini
#eof

sudo -s <<eof
echo '

;;;;;;;;;;;;;;;;;;;;
;      xdebug      ;
;;;;;;;;;;;;;;;;;;;;
extension=xdebug.so

xdebug.remote_enable = On' >> /etc/php/7.3/apache2/php.ini

eof

sudo service apache2 restart
