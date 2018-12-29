#!/bin/bash
# Version 0.1

#
# PHP code sniffer
#
echo -e "$GREEN"
echo ''
echo '###########################################'
echo '#      PHP code sniffer installation      #'
echo '###########################################'
echo ''
echo ''
echo -e "$NORMAL"

composer global require "squizlabs/php_codesniffer=*"

echo "
#
# PHP code sniffer
#
alias phpcs='$HOME/.composer/vendor/bin/phpcs'
alias phpcbf='$HOME/.composer/vendor/bin/phpcbf'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc

exit
