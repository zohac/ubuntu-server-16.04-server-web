#!/bin/bash
# Version 0.1

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
sudo apt-get install -y apache2
# Ajout du module rewrite
a2enmod rewrite
sudo service apache2 restart

# Si erreur 'Failed to enable APR_TCP_DEFER_ACCEPT'
# sudo -s <<eof
#    echo '
#    AcceptFilter http none' >> /etc/apache2/apache2.conf
#    eof
