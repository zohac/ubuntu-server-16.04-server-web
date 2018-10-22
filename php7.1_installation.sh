#!/bin/bash
# Version 0.1

#
# Installation php7.1
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#           php7.1 installation           #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update -y
# apt-cache pkgnames | grep php7.1
sudo apt-get install -y php7.1 php7.1-cli php7.1-common libapache2-mod-php7.1 php7.1-mysql php7.1-fpm php7.1-curl php7.1-gd php7.1-bz2 php7.1-mcrypt php7.1-json php7.1-tidy php7.1-mbstring php7.1-xml php7.1-dev php7.1-soap php-redis php-memcached php7.1-zip php7.1-apcu php7.1-sqlite3
sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php7.1-fpm

# Configuration date
sudo sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/g" /etc/php/7.1/apache2/php.ini

sudo service apache2 restart
