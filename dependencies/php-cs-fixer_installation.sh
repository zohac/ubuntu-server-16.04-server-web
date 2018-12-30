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

#echo -e "$BLUE"'Download PHP-CS-FIXER...'"$NORMAL"
#wget https://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -O php-cs-fixer
#sudo chmod a+x php-cs-fixer
#sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer

composer global require friendsofphp/php-cs-fixer

echo "
#
# PHP-CS-FIXER
#
alias php-cs-fixer='$HOME/.composer/vendor/bin/php-cs-fixer'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc
