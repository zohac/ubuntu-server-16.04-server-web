#!/bin/bash
# Version 0.1

MYSQL_PASSWORD='root'

#
# Installation MySQL
#
echo -e "$GREEN"
echo ''
echo '###########################################'
echo '#           MySQL installation            #'
echo '###########################################'
echo ''
echo ''
echo -e "$NORMAL"

CONF="mysql-server mysql-server/root_password password ${MYSQL_PASSWORD}"
sudo debconf-set-selections <<< ${CONF}
CONF="mysql-server mysql-server/root_password_again password ${MYSQL_PASSWORD}"
sudo debconf-set-selections <<< ${CONF}
sudo apt-get -y install mysql-server

exit
