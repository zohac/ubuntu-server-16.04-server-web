#!/bin/bash
# Version 0.1

#
# Installation php7.1
#
#
# Installation php
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#           php installation           #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$BLUE"'Installation of PHP...'"$NORMAL"
sudo apt-get install -y php

echo -e "$BLUE"'Installation of PHP-CLI...'"$NORMAL"
sudo apt-get install -y php-cli

echo -e "$BLUE"'Installation of PHP-COMMON...'"$NORMAL"
sudo apt-get install -y php-common

echo -e "$BLUE"'Installation of libapache2-mod-PHP...'"$NORMAL"
sudo apt-get install -y libapache2-mod-php

echo -e "$BLUE"'Installation of PHP-MYSQL...'"$NORMAL"
sudo apt-get install -y php-mysql

echo -e "$BLUE"'Installation of PHP-FPM...'"$NORMAL"
sudo apt-get install -y php-fpm

echo -e "$BLUE"'Installation of PHP-CURL...'"$NORMAL"
sudo apt-get install -y php-curl

echo -e "$BLUE"'Installation of PHP-GD...'"$NORMAL"
sudo apt-get install -y php-gd

echo -e "$BLUE"'Installation of PHP-BZ2...'"$NORMAL"
sudo apt-get install -y php-bz2

echo -e "$BLUE"'Installation of PHP-JSON...'"$NORMAL"
sudo apt-get install -y php-json

echo -e "$BLUE"'Installation of PHP-TIDY...'"$NORMAL"
sudo apt-get install -y php-tidy

echo -e "$BLUE"'Installation of PHP-MBSTRING...'"$NORMAL"
sudo apt-get install -y php-mbstring

echo -e "$BLUE"'Installation of PHP-XML...'"$NORMAL"
sudo apt-get install -y php-xml

echo -e "$BLUE"'Installation of PHP-DEV...'"$NORMAL"
sudo apt-get install -y php-dev

echo -e "$BLUE"'Installation of PHP-SOAP...'"$NORMAL"
sudo apt-get install -y php-soap

echo -e "$BLUE"'Installation of PHP-REDIS...'"$NORMAL"
sudo apt-get install -y php-redis

echo -e "$BLUE"'Installation of PHP-MEMCACHED...'"$NORMAL"
sudo apt-get install -y php-memcached

echo -e "$BLUE"'Installation of PHP-ZIP...'"$NORMAL"
sudo apt-get install -y php-zip

echo -e "$BLUE"'Installation of PHP-ACPU...'"$NORMAL"
sudo apt-get install -y php-apcu

echo -e "$BLUE"'Installation of PHP-SQLITE3...'"$NORMAL"
sudo apt-get install -y php-sqlite3

echo -e "$BLUE"'Installation of PHP-intl...'"$NORMAL"
sudo apt-get install -y php-intl

echo -e "$BLUE"'Installation of php-imagick...'"$NORMAL"
sudo apt-get install -y php-imagick

sudo a2enmod proxy_fcgi setenvif
sudo a2enmod actions alias proxy_fcgi fcgid
sudo a2enconf php-fpm

echo -e "$BLUE"'Installation of APCU...'"$NORMAL"
pecl install apcu

echo"extension=apcu.so" | tee -a /etc/php/7.4/mods-available/cache.ini
