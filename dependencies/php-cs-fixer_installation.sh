#!/bin/bash
# Version 0.1

#
# PHP-CS-FIXER
#
echo -e "$GREEN"
echo ''
echo '###########################################'
echo '#         PHP-CS-FIXER installation       #'
echo '###########################################'
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

exit
