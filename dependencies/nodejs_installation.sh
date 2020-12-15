#!/bin/bash
# Version 0.1

#
# PHP-CS-FIXER
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#            NodeJS installation          #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

node --version
npm --version
