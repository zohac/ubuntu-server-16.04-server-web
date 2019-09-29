#!/bin/bash
# Version 0.1

#
# Installation php7.1
#
#
# Installation php7.2
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#           php7.2 installation           #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$BLUE"'Adding a new repository...'"$NORMAL"
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update -y
# apt-cache pkgnames | grep php7.2

echo -e "$BLUE"'Installation of PHP7.2...'"$NORMAL"
sudo apt-get install -y php7.2

echo -e "$BLUE"'Installation of PHP7.2-CLI...'"$NORMAL"
sudo apt-get install -y php7.2-cli

echo -e "$BLUE"'Installation of PHP7.2-COMMON...'"$NORMAL"
sudo apt-get install -y php7.2-common

echo -e "$BLUE"'Installation of libapache2-mod-PHP7.2...'"$NORMAL"
sudo apt-get install -y libapache2-mod-php7.2

echo -e "$BLUE"'Installation of PHP7.2-MYSQL...'"$NORMAL"
sudo apt-get install -y php7.2-mysql

echo -e "$BLUE"'Installation of PHP7.2-FPM...'"$NORMAL"
sudo apt-get install -y php7.2-fpm

echo -e "$BLUE"'Installation of PHP7.2-CURL...'"$NORMAL"
sudo apt-get install -y php7.2-curl

echo -e "$BLUE"'Installation of PHP7.2-GD...'"$NORMAL"
sudo apt-get install -y php7.2-gd

echo -e "$BLUE"'Installation of PHP7.2-BZ2...'"$NORMAL"
sudo apt-get install -y php7.2-bz2

echo -e "$BLUE"'Installation of PHP7.2-JSON...'"$NORMAL"
sudo apt-get install -y php7.2-json

echo -e "$BLUE"'Installation of PHP7.2-TIDY...'"$NORMAL"
sudo apt-get install -y php7.2-tidy

echo -e "$BLUE"'Installation of PHP7.2-MBSTRING...'"$NORMAL"
sudo apt-get install -y php7.2-mbstring

echo -e "$BLUE"'Installation of PHP7.2-XML...'"$NORMAL"
sudo apt-get install -y php7.2-xml

echo -e "$BLUE"'Installation of PHP7.2-DEV...'"$NORMAL"
sudo apt-get install -y php7.2-dev

echo -e "$BLUE"'Installation of PHP7.2-SOAP...'"$NORMAL"
sudo apt-get install -y php7.2-soap

echo -e "$BLUE"'Installation of PHP7.2-REDIS...'"$NORMAL"
sudo apt-get install -y php-redis

echo -e "$BLUE"'Installation of PHP7.2-MEMCACHED...'"$NORMAL"
sudo apt-get install -y php-memcached

echo -e "$BLUE"'Installation of PHP7.2-ZIP...'"$NORMAL"
sudo apt-get install -y php7.2-zip

echo -e "$BLUE"'Installation of PHP7.2-ACPU...'"$NORMAL"
sudo apt-get install -y php-apcu

echo -e "$BLUE"'Installation of PHP7.2-SQLITE3...'"$NORMAL"
sudo apt-get install -y php7.2-sqlite3

echo -e "$BLUE"'Installation of PHP7.2-intl...'"$NORMAL"
sudo apt-get install -y php7.2-intl

echo -e "$BLUE"'Installation of php-imagick...'"$NORMAL"
sudo apt-get install -y php-imagick

sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php7.2-fpm

echo -e "$BLUE"'Installation of APCU...'"$NORMAL"
pecl install apcu

echo"extension=apcu.so" | tee -a /etc/php/7.2/mods-available/cache.ini

# Configuration date
sudo sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/g" /etc/php/7.2/apache2/php.ini

# Display errors
sudo sed -i "s/display_errors = Off/display_errors = On/g" /etc/php/7.2/apache2/php.ini

echo -e "$BLUE"'Apache2 restart...'"$NORMAL"
sudo service apache2 restart
