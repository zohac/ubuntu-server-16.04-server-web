#!/bin/bash
# Version 0.1

MY_HOSTNAME='test'
APACHE_LOG_DIR='${APACHE_LOG_DIR}'

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if tput -v >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi

RED=""
GREEN=""
YELLOW=""
BLUE=""
BOLD=""
NORMAL=""

if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
fi

printf "%s" "${GREEN}"
echo '  _       __     __                         '
echo ' | |     / /__  / /________  ____ ___  ___  '
echo ' | | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \ '
echo ' | |/ |/ /  __/ / /__/ /_/ / / / / / /  __/ '
echo ' |__/|__/\___/_/\___/\____/_/ /_/ /_/\___/  '
echo ''
echo 'Installing Apache2/PHP7.1/MySQL for a development web server on ubuntu server 16.04.'
echo ''
echo ''
printf "%s" "${NORMAL}"

#
# Update the server
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#             Global update!              #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
sudo apt-get -y update
sudo apt-get -y upgrade

# Liste des paquets pouvant-être mis à jour
# apt list --upgradable

#
# Installation dependencies
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#        dependencies installation        #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
sudo apt-get install -y build-essential
sudo apt-get install -y apt-transport-https
sudo apt-get install -y zip
sudo apt-get install -y python-pip
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell || return
python setup.py install

#
# Installation apache2
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#         apache2 installation            #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
sudo apt-get install -y apache2
# Ajout du module rewrite
a2enmod rewrite
sudo service apache2 restart

# Si erreur 'Failed to enable APR_TCP_DEFER_ACCEPT'
# sudo -s <<eof
#    echo '
#    AcceptFilter http none' >> /etc/apache2/apache2.conf
#    eof

#
# Installation MySQL
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#           MySQL installation            #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
sudo apt-get install -y mysql-server

#
# Installation php7.1
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#           php7.1 installation           #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
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

#
# Installation de xdebug
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#           xdebug installation           #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"

sudo pecl install xdebug

# setup Xdebug
sudo -s <<eof
 echo '
xdebug.show_error_trace = 1
' >> /etc/php/7.1/mods-available/xdebug.ini
eof

sudo -s <<eof
echo '
;;;;;;;;;;;;;;;;;;;;
;      xdebug      ;
;;;;;;;;;;;;;;;;;;;;
zend_extension="/usr/lib/php/20160303/xdebug.so"
xdebug.remote_enable = On
' >> /etc/php/7.1/apache2/php.ini
eof

sudo -s <<eof
echo '
;;;;;;;;;;;;;;;;;;;;
;      xdebug      ;
;;;;;;;;;;;;;;;;;;;;
zend_extension="/usr/lib/php/20160303/xdebug.so"
xdebug.remote_enable = On
' >> /etc/php/7.1/cli/php.ini
eof

sudo service apache2 restart

#
# Composer
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#          Composer installation          #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin
php -r "unlink('composer-setup.php');"
sudo chown "$USER":"$USER" /usr/local/bin/composer.phar
sudo chown -R "$USER":"$USER" .composer
echo "
#
# Composer
#
alias composer='/usr/local/bin/composer.phar'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc

#
# PHP-CS-FIXER
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#         PHP-CS-FIXER installation       #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
composer global require friendsofphp/php-cs-fixer
echo "
#
# PHP-CS-FIXER
#
alias php-cs-fixer='$HOME/.composer/vendor/bin/php-cs-fixer'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc

#
# PHP code sniffer
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#      PHP code sniffer installation      #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
composer global require "squizlabs/php_codesniffer=*"
echo "
#
# PHP code sniffer
#
alias phpcs='$HOME/.composer/vendor/bin/phpcs'
alias phpcbf='$HOME/.composer/vendor/bin/phpcbf'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc

#
# PHP Mess Detector
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#     PHP Mess Detector installation      #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
wget -c http://static.phpmd.org/php/latest/phpmd.phar
chmod u+x phpmd.phar
sudo mv phpmd.phar /usr/local/bin/phpmd.phar
echo "
#
# PHP Mess Detector
#
alias phpmd='/usr/local/bin/phpmd.phar'
alias phpmd-src='/usr/local/bin/phpmd.phar src html codesize.xml --reportfile phpmd.html'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc

#
# PHP Copy/Paste Detector (PHPCPD)
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#         PHP Copy/Paste Detector         #'
echo '#               installation              #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
wget https://phar.phpunit.de/phpcpd.phar
chmod +x phpcpd.phar
sudo mv phpcpd.phar /usr/local/bin/phpcpd
echo "
#
# PHP Copy/Paste Detector
#
alias phpcpd='/usr/local/bin/phpcpd'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc

# example of use:
#
# php-cs-fixer fix src --rules=@Symfony,-@PSR1,-@PSR2
# phpcs
# phpcbf
# phpmd src html codesize,unusedcode,naming --reportfile phpmd.html --suffixes php,phtml

#
# Installation postfix
#
#printf "%s" "${GREEN}"
#echo ''
#echo '###########################################'
#echo '#           Installation postfix          #'
#echo '###########################################'
#echo ''
#echo ''
#printf "%s" "${NORMAL}"
#sudo apt-get -y install postfix
#sudo apt-get install -y mailutils
# Site internet
# home-ubuntu-server
# /etc/postfix/main.cf
# sudo dpkg-reconfigure postfix
# echo "Cesi est un mail de test" | mail -s "Sujet de test" fenrir0680@gmail.com

#
# Setup server
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#               Setup server              #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"

if [ ! -d "$HOME/www" ]; then
  mkdir "$HOME"/www
fi

sudo chown -R "$USER":www-data "$HOME"/www

sudo mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.old
touch "$HOME"/000-default.conf
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
    ErrorLog $APACHE_LOG_DIR/error.log
    CustomLog $APACHE_LOG_DIR/access.log combined
</VirtualHost>
vim: syntax=apache ts=4 sw=4 sts=4 sr noet"  >>  "$HOME"/000-default.conf
sed -i "s/vim:/# vim:/g" "$HOME"/000-default.conf

sudo mv  "$HOME"/000-default.conf /etc/apache2/sites-available/000-default.conf

sudo apache2ctl configtest
sudo service apache2 reload

#
# Installation de samba
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#                  SAMBA                  #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"

#!/bin/bash

sudo apt-get install -y samba

#Add to end of config file
sudo cp /etc/samba/smb.conf "$HOME"/smb.conf
echo "
[Share]
comment = Share
path = $HOME
writeable = yes
guest ok = yes
create mask = 0644
directory mask = 0755
force user = $USER" >> "$HOME"/smb.conf

sudo mv "$HOME"/smb.conf /etc/samba/smb.conf

if [ -n "${MY_HOSTNAME+x}" ]; then
    touch "$HOME"/hostname
    echo "$MY_HOSTNAME" >> "$HOME"/hostname

    sudo mv "$HOME"/hostname /etc/hostname
fi

sudo service smbd restart

#
# Installation of Blackfire
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#         BlackFire Installation          #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
wget -q -O - https://packagecloud.io/gpg.key | sudo apt-key add -
echo "deb http://packages.blackfire.io/debian any main" | sudo tee /etc/apt/sources.list.d/blackfire.list
sudo apt-get update -y
sudo apt-get install -y blackfire-agent
# If is the first install :
# sudo blackfire-agent -register
#
# ClientID
# ClientToken
#
# sudo /etc/init.d/blackfire-agent restart
#

sudo apt-get install -y blackfire-agent
# blackfire config
# ClientID
# ClientToken

sudo apt-get install -y blackfire-php

#
# Shell custom
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#            zsh installation             #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
sudo apt-get install -y fonts-powerline
sudo apt-get install -y zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git  "$HOME"/.oh-my-zsh
cp "$HOME"/.oh-my-zsh/templates/zshrc.zsh-template "$HOME"/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' "$HOME"/.zshrc
chsh -s /bin/zsh

echo "
#
# Composer
#
alias composer='/usr/local/bin/composer.phar'
#
# PHP-CS-FIXER
#
alias php-cs-fixer='$HOME/.config/composer/vendor/bin/php-cs-fixer'
#
# PHP code sniffer
#
alias phpcs='$HOME/.config/composer/vendor/bin/phpcs'
alias phpcbf='$HOME/.config/composer/vendor/bin/phpcbf'
#
# PHP Mess Detector
#
alias phpmd='/usr/local/bin/phpmd.phar'
#
# PHP Copy/Paste Detector
#
alias phpcpd='/usr/local/bin/phpcpd'" >> "$HOME"/.zshrc

source "$HOME"/.zshrc

sudo chmod -R 755 "$HOME"/.oh-my-zsh

#
# Cleaning after installation
#
printf "%s" "${GREEN}"
echo ''
echo '###########################################'
echo '#                Cleaning                 #'
echo '###########################################'
echo ''
echo ''
printf "%s" "${NORMAL}"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y autoremove --purge
sudo apt-get -y autoclean

if [ -d "ubuntu-server-16.04-server-web" ]; then
  sudo rm -r ubuntu-server-16.04-server-web
fi

printf "%s" "${GREEN}" echo ''
echo '  _____         __                    '
echo ' /__  /  ____  / /_  ____ ______      '
echo '   / /  / __ \/ __ \/ __ `/ ___/      '
echo '  / /__/ /_/ / / / / /_/ / /__        '
echo ' /____/\____/_/ /_/\__,_/\___/  web server installation script...is now installed!'
echo ''
echo ''
printf "%s" "${NORMAL}"

while :
do

    read -p "You should restart [Y/n] ?" RESPONSE

    case $RESPONSE in
        N|n)
            echo "Remember to restart !"
            break
        ;;
        Y|y)
            #Redémarrage
            sudo reboot
            break
        ;;
        *)
            echo "Error, you had to answer yes[Y] or no[n]."
        ;;
    esac
done

exit 0;
