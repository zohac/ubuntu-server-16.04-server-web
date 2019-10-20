#!/bin/bash
# Version 0.1

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
alias phpcpd='/usr/local/bin/phpcpd'" >>"$HOME"'/.bashrc'

# shellcheck source=$HOME/.bashrc
source "$HOME"'/.bashrc'

exit 0

# example of use:
#
# php-cs-fixer fix src --rules=@Symfony,-@PSR1,-@PSR2
# php code sniffer :
#           - phpcs
#           - phpcbf
# phpmd src html codesize,unusedcode,naming --reportfile phpmd.html --suffixes php,phtml
