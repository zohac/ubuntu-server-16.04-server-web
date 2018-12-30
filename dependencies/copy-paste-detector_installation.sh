#!/bin/bash
# Version 0.1

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
NORMAL="\e[39m"

#
# PHP Copy/Paste Detector (PHPCPD)
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#         PHP Copy/Paste Detector         #'
echo -e "$GREEN"'#               installation              #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$YELLOW"
wget https://phar.phpunit.de/phpcpd.phar
echo -e "$NORMAL"
sudo mv phpcpd.phar /usr/local/bin/phpcpd
chmod u+x /usr/local/bin/phpcpd

echo "
#
# PHP Copy/Paste Detector
#
alias phpcpd='/usr/local/bin/phpcpd'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc

# example of use:
#
# php-cs-fixer fix src --rules=@Symfony,-@PSR1,-@PSR2
# php code sniffer :
#           - phpcs
#           - phpcbf
# phpmd src html codesize,unusedcode,naming --reportfile phpmd.html --suffixes php,phtml
