#!/bin/bash
# Version 0.1

#
# Installation php7.1
#
#
# Installation php7.3
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#           php7.3 installation           #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$BLUE"'Adding a new repository...'"$NORMAL"
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update -y
# apt-cache pkgnames | grep php7.3

echo -e "$BLUE"'Installation of PHP7.3...'"$NORMAL"
sudo apt-get install -y php7.3

echo -e "$BLUE"'Installation of PHP7.3-CLI...'"$NORMAL"
sudo apt-get install -y php7.3-cli

echo -e "$BLUE"'Installation of PHP7.3-COMMON...'"$NORMAL"
sudo apt-get install -y php7.3-common

echo -e "$BLUE"'Installation of libapache2-mod-PHP7.3...'"$NORMAL"
sudo apt-get install -y libapache2-mod-php7.3

echo -e "$BLUE"'Installation of PHP7.3-MYSQL...'"$NORMAL"
sudo apt-get install -y php7.3-mysql

echo -e "$BLUE"'Installation of PHP7.3-FPM...'"$NORMAL"
sudo apt-get install -y php7.3-fpm

echo -e "$BLUE"'Installation of PHP7.3-CURL...'"$NORMAL"
sudo apt-get install -y php7.3-curl

echo -e "$BLUE"'Installation of PHP7.3-GD...'"$NORMAL"
sudo apt-get install -y php7.3-gd

echo -e "$BLUE"'Installation of PHP7.3-BZ2...'"$NORMAL"
sudo apt-get install -y php7.3-bz2

echo -e "$BLUE"'Installation of PHP7.3-JSON...'"$NORMAL"
sudo apt-get install -y php7.3-json

echo -e "$BLUE"'Installation of PHP7.3-TIDY...'"$NORMAL"
sudo apt-get install -y php7.3-tidy

echo -e "$BLUE"'Installation of PHP7.3-MBSTRING...'"$NORMAL"
sudo apt-get install -y php7.3-mbstring

echo -e "$BLUE"'Installation of PHP7.3-XML...'"$NORMAL"
sudo apt-get install -y php7.3-xml

echo -e "$BLUE"'Installation of PHP7.3-DEV...'"$NORMAL"
sudo apt-get install -y php7.3-dev

echo -e "$BLUE"'Installation of PHP7.3-SOAP...'"$NORMAL"
sudo apt-get install -y php7.3-soap

echo -e "$BLUE"'Installation of PHP7.3-REDIS...'"$NORMAL"
sudo apt-get install -y php-redis

echo -e "$BLUE"'Installation of PHP7.3-MEMCACHED...'"$NORMAL"
sudo apt-get install -y php-memcached

echo -e "$BLUE"'Installation of PHP7.3-ZIP...'"$NORMAL"
sudo apt-get install -y php7.3-zip

echo -e "$BLUE"'Installation of PHP7.3-ACPU...'"$NORMAL"
sudo apt-get install -y php-apcu

echo -e "$BLUE"'Installation of PHP7.3-SQLITE3...'"$NORMAL"
sudo apt-get install -y php7.3-sqlite3

echo -e "$BLUE"'Installation of PHP7.3-intl...'"$NORMAL"
sudo apt-get install -y php7.3-intl

echo -e "$BLUE"'Installation of php-imagick...'"$NORMAL"
sudo apt-get install -y php-imagick

sudo a2enmod proxy_fcgi setenvif
sudo a2enmod actions alias proxy_fcgi fcgid
sudo a2enconf php7.3-fpm

echo -e "$BLUE"'Installation of APCU...'"$NORMAL"
pecl install apcu

echo"extension=apcu.so" | tee -a /etc/php/7.3/mods-available/cache.ini

# Configuration date
sudo sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/g" /etc/php/7.3/apache2/php.ini

# Display errors
sudo sed -i "s/display_errors = Off/display_errors = On/g" /etc/php/7.3/apache2/php.ini

echo -e "$BLUE"'Apache2 restart...'"$NORMAL"
sudo service apache2 restart
