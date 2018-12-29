#!/bin/bash
# Version 0.1

#
# Installation apache2
#
echo -e "$GREEN"
echo ''
echo '###########################################'
echo '#         apache2 installation            #'
echo '###########################################'
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
