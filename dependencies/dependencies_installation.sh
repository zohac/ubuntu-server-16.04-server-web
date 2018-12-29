#!/bin/bash
# Version 0.1

echo -e "$GREEN"
echo ''
echo '###########################################'
echo '#        dependencies installation        #'
echo '###########################################'
echo ''
echo ''
echo -e "$NORMAL"

sudo apt-get install -y build-essential
sudo apt-get install -y apt-transport-https
sudo apt-get install -y zip
sudo apt-get install -y python-pip
sudo apt-get install -y software-properties-common
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell || return
python setup.py install

exit
