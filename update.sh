#!/bin/bash
# Version 0.1

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
sudo apt-get -y update
sudo apt-get -y upgrade

# Liste des paquets pouvant-être mis à jour
# apt list --upgradable
