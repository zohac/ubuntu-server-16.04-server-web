#!/bin/bash
# Version 0.1

#
# Cleaning after installation
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#                Cleaning                 #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y autoremove --purge
sudo apt-get -y autoclean

if [ -d "ubuntu-server-16.04-server-web" ]; then
    sudo rm -r ubuntu-server-16.04-server-web
fi
