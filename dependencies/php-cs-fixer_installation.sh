#!/bin/bash
# Version 0.1

#
# PHP-CS-FIXER
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#         PHP-CS-FIXER installation       #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

wget https://cs.symfony.com/download/php-cs-fixer-v2.phar -O php-cs-fixer
sudo chmod a+x php-cs-fixer
sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer

# example of use:
#
# php-cs-fixer fix src --rules=@Symfony,-@PSR1,-@PSR2
# php code sniffer :
#           - phpcs
#           - phpcbf
# phpmd src html codesize,unusedcode,naming --reportfile phpmd.html --suffixes php,phtml
