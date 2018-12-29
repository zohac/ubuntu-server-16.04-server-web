#!/bin/bash
# Version 0.1

#
# Installation of Blackfire
#
echo -e "$GREEN"
echo ''
echo '###########################################'
echo '#         BlackFire Installation          #'
echo '###########################################'
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
