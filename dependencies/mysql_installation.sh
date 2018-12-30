#!/bin/bash
# Version 0.1

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
NORMAL="\e[39m"

MYSQL_PASSWORD='root'

#
# Installation MySQL
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#           MySQL installation            #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$BLUE"'Installation of Mysql...'"$NORMAL"
CONF="mysql-server mysql-server/root_password password ${MYSQL_PASSWORD}"
sudo debconf-set-selections <<< ${CONF}
CONF="mysql-server mysql-server/root_password_again password ${MYSQL_PASSWORD}"
sudo debconf-set-selections <<< ${CONF}
sudo apt-get -y install mysql-server
