#!/bin/bash
# Version 0.1

#
# Update the server
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#             Global update!              #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$BLUE"'Update...'"$NORMAL"
sudo apt-get -y update

echo -e "$BLUE"'Upgrade...'"$NORMAL"
sudo apt-get -y upgrade

exit 0

# Liste des paquets pouvant être mis à jour
# apt list --upgradable
