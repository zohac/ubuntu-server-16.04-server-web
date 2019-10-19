#!/bin/bash
# Version 0.1

VIRTUAL_HOST_PATH="$HOME/www"

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
sudo a2enmod rewrite
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

if [ ! -d VIRTUAL_HOST_PATH ]; then
    mkdir VIRTUAL_HOST_PATH
fi

sudo chown -R "$USER":www-data VIRTUAL_HOST_PATH

sudo mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.old
sudo cp /inc/templates/apache2.conf /etc/apache2/sites-available/000-default.conf

sed -i "s/VIRTUAL_HOST_PATH/$VIRTUAL_HOST_PATH/g" "$HOME"'/000-default.conf'

sudo apache2ctl configtest
sudo service apache2 reload
