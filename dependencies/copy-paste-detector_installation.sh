#!/bin/bash
# Version 0.1

#
# PHP Copy/Paste Detector (PHPCPD)
#
echo -e "$GREEN"
echo ''
echo '###########################################'
echo '#         PHP Copy/Paste Detector         #'
echo '#               installation              #'
echo '###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$YELLOW"
wget https://phar.phpunit.de/phpcpd.phar
echo -e "$NORMAL"
chmod +x phpcpd.phar
sudo mv phpcpd.phar /usr/local/bin/phpcpd

echo "
#
# PHP Copy/Paste Detector
#
alias phpcpd='/usr/local/bin/phpcpd'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc

# example of use:
#
# php-cs-fixer fix src --rules=@Symfony,-@PSR1,-@PSR2
# phpcs
# phpcbf
# phpmd src html codesize,unusedcode,naming --reportfile phpmd.html --suffixes php,phtml
