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

#git clone https://github.com/xdebug/xdebug.git
#cd xdebug
#./rebuild.sh

#cd

#sudo mv xdebug/modules/xdebug.so /usr/lib/php/20160303/xdebug.so

#sudo rm -R xdebug

# setup Xdebug
sudo -s <<eof
 echo '
xdebug.show_error_trace = 1
' >> /etc/php/7.2/mods-available/xdebug.ini
eof

sudo -s <<eof
echo '
;;;;;;;;;;;;;;;;;;;;
;      xdebug      ;
;;;;;;;;;;;;;;;;;;;;
zend_extension="/usr/lib/php/20160303/xdebug.so"

xdebug.remote_enable = On
' >> /etc/php/7.2/apache2/php.ini
eof

sudo -s <<eof
echo '
;;;;;;;;;;;;;;;;;;;;
;      xdebug      ;
;;;;;;;;;;;;;;;;;;;;
zend_extension="/usr/lib/php/20160303/xdebug.so"

xdebug.remote_enable = On
' >> /etc/php/7.2/cli/php.ini
eof

sudo service apache2 restart
