#!/bin/bash
# Version 0.1

printf "${GREEN}"
echo ''
echo '###########################################'
echo '#        dependencies installation        #'
echo '###########################################'
echo ''
echo ''
printf "${NORMAL}"
sudo apt-get install -y build-essential
sudo apt-get install -y apt-transport-https
sudo apt-get install -y zip
sudo apt-get install -y python-pip
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell
python setup.py install
