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

echo -e "$BLUE"'Install python...'"$NORMAL"
sudo apt-get install -y python-pip

echo -e "$BLUE"'Install software-properties-common...'"$NORMAL"
sudo apt-get install -y software-properties-common

echo -e "$BLUE"'Download powerline-shell...'"$NORMAL"
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell || return

echo -e "$BLUE"'Install powerline-shell...'"$NORMAL"
python setup.py install
