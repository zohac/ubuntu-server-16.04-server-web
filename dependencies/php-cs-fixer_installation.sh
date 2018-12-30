#!/bin/bash
# Version 0.1

FULL_DIR=$PWD'/'$(dirname $0)
source "$FULL_DIR"/color.sh

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

composer global require friendsofphp/php-cs-fixer

echo "
#
# PHP-CS-FIXER
#
alias php-cs-fixer='$HOME/.composer/vendor/bin/php-cs-fixer'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc

# example of use:
#
# php-cs-fixer fix src --rules=@Symfony,-@PSR1,-@PSR2
# php code sniffer :
#           - phpcs
#           - phpcbf
# phpmd src html codesize,unusedcode,naming --reportfile phpmd.html --suffixes php,phtml
