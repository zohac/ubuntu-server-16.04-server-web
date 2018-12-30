#!/bin/bash
# Version 0.1

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
NORMAL="\e[39m"

#
# Installation of Blackfire
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#         BlackFire Installation          #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$YELLOW"
wget -q -O - https://packagecloud.io/gpg.key | sudo apt-key add -
echo -e "$NORMAL"

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
