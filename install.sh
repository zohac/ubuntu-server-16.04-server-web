#!/bin/bash
# Version 0.1

MY_HOSTNAME="test"

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
fi

printf "${GREEN}"
echo ' _       __     __                        '
echo '| |     / /__  / /________  ____ ___  ___ '
echo '| | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \'
echo '| |/ |/ /  __/ / /__/ /_/ / / / / / /  __/'
echo '|__/|__/\___/_/\___/\____/_/ /_/ /_/\___/ '
echo ''
echo 'Installing Apache2/PHP7.1/MySQL for a development web server on a raspberrypi.'
echo ''
echo ''
printf "${NORMAL}"

#
# Update the server
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#             Global update!              #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
apt-get -y update
apt-get -y upgrade

# Liste des paquets pouvant-être mis à jour
# apt list --upgradable

#
# Installation dependencies
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#        dependencies installation        #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
apt-get install -y build-essential
apt-get install -y apt-transport-https
apt-get install -y zip
apt-get install -y python-pip
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell
python setup.py install

#
# Installation apache2
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#         apache2 installation            #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
apt-get install -y apache2
# Ajout du module rewrite
a2enmod rewrite
service apache2 restart

#
# Installation MySQL
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#           MySQL installation            #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
apt-get install -y mysql-server

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
apt-get install -y python-software-properties
add-apt-repository -y ppa:ondrej/php
apt-get update -y
# apt-cache pkgnames | grep php7.1
apt-get install -y php7.1 php7.1-cli php7.1-common libapache2-mod-php7.1 php7.1-mysql php7.1-fpm php7.1-curl php7.1-gd php7.1-bz2 php7.1-mcrypt php7.1-json php7.1-tidy php7.1-mbstring php7.1-xml php7.1-dev php7.1-soap php-redis php-memcached php7.1-zip php7.1-apcu php7.1-sqlite3
a2enmod proxy_fcgi setenvif
a2enconf php7.1-fpm

# Configuration date
sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/g" /etc/php/7.1/apache2/php.ini

service apache2 restart

#
# Installation de xdebug
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#           xdebug installation           #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"

pecl install xdebug

# setup Xdebug
echo "
xdebug.show_error_trace = 1
" >> /etc/php/7.1/mods-available/xdebug.ini

echo '
;;;;;;;;;;;;;;;;;;;;
;      xdebug      ;
;;;;;;;;;;;;;;;;;;;;
zend_extension="/usr/lib/php/20160303/xdebug.so"

xdebug.remote_enable = On
' >> /etc/php/7.1/apache2/php.ini

echo '
;;;;;;;;;;;;;;;;;;;;
;      xdebug      ;
;;;;;;;;;;;;;;;;;;;;
zend_extension="/usr/lib/php/20160303/xdebug.so"

xdebug.remote_enable = On
' >> /etc/php/7.1/cli/php.ini

service apache2 restart

#
# Composer
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#          Composer installation          #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/local/bin
php -r "unlink('composer-setup.php');"
echo "
alias composer='/usr/local/bin/composer.phar'" >> ~/.bashrc
. ~/.bashrc

#
# PHP-CS-FIXER
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#         PHP-CS-FIXER installation       #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
composer global require friendsofphp/php-cs-fixer
echo "
alias php-cs-fixer='$HOME/.config/composer/vendor/bin/php-cs-fixer'" >> ~/.bashrc
. ~/.bashrc

#
# PHP code sniffer
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#      PHP code sniffer installation      #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
composer global require "squizlabs/php_codesniffer=*"
echo "
alias phpcs='$HOME/.config/composer/vendor/bin/phpcs'
alias phpcbf='$HOME/.config/composer/vendor/bin/phpcbf'
export PATH='$HOME/.config/composer/vendor/bin'" >> ~/.bashrc
. ~/.bashrc

#
# PHP Mess Detector
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#     PHP Mess Detector installation      #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
wget -c http://static.phpmd.org/php/latest/phpmd.phar
chmod u+x phpmd.phar
mv phpmd.phar /usr/local/bin/phpmd.phar
echo "
alias phpmd='/usr/local/bin/phpmd.phar'" >> ~/.bashrc
. ~/.bashrc

#
# PHP Copy/Paste Detector (PHPCPD)
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#         PHP Copy/Paste Detector         #'
echo '#               installation              #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
wget https://phar.phpunit.de/phpcpd.phar
chmod +x phpcpd.phar
mv phpcpd.phar /usr/local/bin/phpcpd
echo "
alias phpcpd='/usr/local/bin/phpcpd'" >> ~/.bashrc

# example of use:
#
# php-cs-fixer fix src --rules=@Symfony,-@PSR1,-@PSR2
# phpcs
# phpcbf
# phpmd src html codesize,unusedcode,naming --reportfile phpmd.html --suffixes php,phtml

#
# Installation postfix
#
#printf "${GREEN}"
#echo ''
#echo '###########################################'
#echo '#           Installation postfix          #'
#echo '###########################################'
#echo ''
#echo ''
#printf "${NORMAL}"
#apt-get -y install postfix
#apt-get install -y mailutils
# Site internet
# home-ubuntu-server
# /etc/postfix/main.cf
# dpkg-reconfigure postfix
# echo "Cesi est un mail de test" | mail -s "Sujet de test" fenrir0680@gmail.com

#
# Setup server
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#               Setup server              #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"

if [ ! -d "$HOME/www" ]; then
  mkdir $HOME/www
fi

chown -R $USER:www-data $HOME/www

mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.old
touch $HOME/000-default.conf
echo "
<VirtualHost *:80>

    # The ServerName directive sets the request scheme, hostname and port that
    # the server uses to identify itself. This is used when creating
    # redirection URLs. In the context of virtual hosts, the ServerName
    # specifies what hostname must appear in the request's Host: header to
    # match this virtual host. For the default virtual host (this file) this
    # value is not decisive as it is used as a last resort host regardless.
    # However, you must set it for any further virtual host explicitly.
    #ServerName www.example.com

    ServerAdmin webmaster@localhost
    DocumentRoot $HOME/www
    <Directory $HOME/www/>
            Options Indexes FollowSymLinks MultiViews
            AllowOverride All
            Require all granted
    </Directory>

    # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
    # error, crit, alert, emerg.
    # It is also possible to configure the loglevel for particular
    # modules, e.g.
    #LogLevel info ssl:warn

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

vim: syntax=apache ts=4 sw=4 sts=4 sr noet"  >>  $HOME/000-default.conf
sed -i "s/vim:/# vim:/g" $HOME/000-default.conf

mv  $HOME/000-default.conf /etc/apache2/sites-available/000-default.conf

apache2ctl configtest
service apache2 reload

#
# Installation de samba
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#                  SAMBA                  #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"

#!/bin/bash

apt-get install -y samba

#Add to end of config file
#Add to end of config file
cp /etc/samba/smb.conf $HOME/smb.conf
echo "
[Share]
comment = Share
path = $HOME
writeable = yes
guest ok = yes
create mask = 0644
directory mask = 0755
force user = $USER" >> $HOME/smb.conf

mv $HOME/smb.conf /etc/samba/smb.conf

if [ ! -z ${MY_HOSTNAME+x} ]; then
    touch $HOME/hostname
    echo "$MY_HOSTNAME" >> $HOME/hostname

    mv $HOME/hostname /etc/hostname
fi

service smbd restart

#
# Installation of Blackfire
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#         BlackFire Installation          #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
wget -q -O - https://packagecloud.io/gpg.key | apt-key add -
echo "deb http://packages.blackfire.io/debian any main" | tee /etc/apt/sources.list.d/blackfire.list
apt-get update -y
apt-get install -y blackfire-agent
# If is the first install :
#
# blackfire config
# ClientID
# ClientToken
# /etc/init.d/blackfire-agent restart
#

apt-get install -y blackfire-agent
# blackfire config
# ClientID
# ClientToken

apt-get install -y blackfire-php

#
# Cleaning after installation
#
printf "${GREEN}"
echo ''
echo '###########################################'
echo '#                Cleaning                 #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
apt-get -y update
apt-get -y upgrade
apt-get -y autoremove --purge
apt-get -y autoclean

if [ -d "raspbian---installation-serveur" ]; then
  rm -r raspbian---installation-serveur
fi

printf "${GREEN}" echo ''
echo ' _____         __                    '
echo '/__  /  ____  / /_  ____ ______      '
echo '  / /  / __ \/ __ \/ __ `/ ___/      '
echo ' / /__/ /_/ / / / / /_/ / /__        '
echo '/____/\____/_/ /_/\__,_/\___/  web server installation script...is now installed!'
echo ''
echo ''
printf "${NORMAL}"

#
# Launching the shell
#
zsh
