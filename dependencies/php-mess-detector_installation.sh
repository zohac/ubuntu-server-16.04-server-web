#!/bin/bash
# Version 0.1

#
# PHP Mess Detector
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#     PHP Mess Detector installation      #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$YELLOW"
wget -c http://static.phpmd.org/php/latest/phpmd.phar
echo -e "$NORMAL"chmod u+x phpmd.phar
sudo mv phpmd.phar /usr/local/bin/phpmd.phar

echo "
#
# PHP Mess Detector
#
alias phpmd='/usr/local/bin/phpmd.phar'
alias phpmd-src='/usr/local/bin/phpmd.phar src html codesize.xml --reportfile phpmd.html'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc
