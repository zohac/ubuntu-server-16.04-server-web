#!/bin/bash
# Version 0.1

#
# PHP-CS-FIXER
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#            Yarn installation            #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update -y
sudo apt-get install -y yarn
