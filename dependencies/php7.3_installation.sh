#!/bin/bash
# Version 0.1

#
# Installation php7.1
#
#
# Installation php7.3
#
echo -e "$GREEN"
echo ''
echo '###########################################'
echo '#           php7.3 installation           #'
echo '###########################################'
echo ''
echo ''
echo -e "$NORMAL"

sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update -y
# apt-cache pkgnames | grep php7.3
sudo apt-get install -y php7.3
sudo apt-get install -y php7.3-cli
sudo apt-get install -y php7.3-common
sudo apt-get install -y libapache2-mod-php7.3
sudo apt-get install -y php7.3-mysql
sudo apt-get install -y php7.3-fpm
sudo apt-get install -y php7.3-curl
sudo apt-get install -y php7.3-gd
sudo apt-get install -y php7.3-bz2
sudo apt-get install -y php7.3-json
sudo apt-get install -y php7.3-tidy
sudo apt-get install -y php7.3-mbstring
sudo apt-get install -y php7.3-xml
sudo apt-get install -y php7.3-dev
sudo apt-get install -y php7.3-soap
sudo apt-get install -y php-redis
sudo apt-get install -y php-memcached
sudo apt-get install -y php7.3-zip
sudo apt-get install -y php-apcu
sudo apt-get install -y php7.3-sqlite3
sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php7.3-fpm

pecl install apcu

echo"extension=apcu.so" | tee -a /etc/php/7.3/mods-available/cache.ini

# Configuration date
sudo sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/g" /etc/php/7.3/apache2/php.ini

sudo service apache2 restart

exit 0;