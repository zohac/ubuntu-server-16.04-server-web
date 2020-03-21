#!/bin/bash
# Version 0.1

#
# Installation php7.1
#
#
# Installation php7.2
#
echo ''
echo -e "$GREEN"'###################################################'
echo -e "$GREEN"'#           Symfony Binary installation           #'
echo -e "$GREEN"'###################################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$BLUE"'Symfony Binary installation...'"$NORMAL"
sudo wget https://get.symfony.com/cli/installer -O - | bash

echo -e "$BLUE"'Install symfony globally on your system...'"$NORMAL"
sudo mv /home/"$USER"/.symfony/bin/symfony /usr/local/bin/symfony
