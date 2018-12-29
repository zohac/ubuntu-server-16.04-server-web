#!/bin/bash
# Version 0.1

#
# Shell custom
#
echo -e "$GREEN"
echo ''
echo '###########################################'
echo '#            zsh installation             #'
echo '###########################################'
echo ''
echo ''
echo -e "$NORMAL"

sudo apt-get install -y fonts-powerline
sudo apt-get install -y zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#git clone https://github.com/robbyrussell/oh-my-zsh.git  "$HOME"/.oh-my-zsh
#rm "$HOME"/.zshrc
#cp "$HOME"/.oh-my-zsh/templates/zshrc.zsh-template "$HOME"/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' "$HOME"/.zshrc
chsh -s $(which zsh)

echo "
#
# Composer
#
alias composer='/usr/local/bin/composer.phar'

#
# PHP-CS-FIXER
#
alias php-cs-fixer='$HOME/.config/composer/vendor/bin/php-cs-fixer'

#
# PHP code sniffer
#
alias phpcs='$HOME/.config/composer/vendor/bin/phpcs'
alias phpcbf='$HOME/.config/composer/vendor/bin/phpcbf'

#
# PHP Mess Detector
#
alias phpmd='/usr/local/bin/phpmd.phar'

#
# PHP Copy/Paste Detector
#
alias phpcpd='/usr/local/bin/phpcpd'" >> "$HOME"/.zshrc

source "$HOME"/.zshrc

sudo chmod -R 755 "$HOME"/.oh-my-zsh
