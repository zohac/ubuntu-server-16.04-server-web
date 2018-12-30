#!/bin/bash
# Version 0.1

source color.sh

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

echo -e "$BLUE"'Install software-properties-common...'"$NORMAL"
sudo apt-get install -y software-properties-common

echo -e "$BLUE"'Install python...'"$NORMAL"
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt update
sudo apt install python3.6

echo -e "$BLUE"'Install powerline-shell...'"$NORMAL"
pip install powerline-shell
