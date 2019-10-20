#!/bin/bash
# Version 0.1

echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#        dependencies installation        #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$BLUE"'Install build-essential...'"$NORMAL"
sudo apt-get install -y build-essential

echo -e "$BLUE"'Install apt-transport-https...'"$NORMAL"
sudo apt-get install -y apt-transport-https

echo -e "$BLUE"'Install zip...'"$NORMAL"
sudo apt-get install -y zip

echo -e "$BLUE"'Install unzip...'"$NORMAL"
sudo apt-get install -y unzip

echo -e "$BLUE"'Install software-properties-common...'"$NORMAL"
sudo apt-get install -y software-properties-common

echo -e "$BLUE"'Install python-pip...'"$NORMAL"
sudo apt install -y python-pip

echo -e "$BLUE"'Install powerline-shell...'"$NORMAL"
sudo pip install powerline-shell

echo -e "$BLUE"'Install git-flow...'"$NORMAL"
sudo apt-get install -y git-flow

exit 0
