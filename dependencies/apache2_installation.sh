#!/bin/bash
# Version 0.1

APACHE_LOG_DIR='${APACHE_LOG_DIR}'
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
NORMAL="\e[39m"

#
# Installation apache2
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#         apache2 installation            #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

sudo apt-get install -y apache2
# Add rewrite module
a2enmod rewrite
sudo service apache2 restart

# Si erreur 'Failed to enable APR_TCP_DEFER_ACCEPT'
# sudo -s <<eof
#    echo '
#    AcceptFilter http none' >> /etc/apache2/apache2.conf
#    eof

#
# Setup server
#
echo -e "$GREEN"
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#               Setup server              #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

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
