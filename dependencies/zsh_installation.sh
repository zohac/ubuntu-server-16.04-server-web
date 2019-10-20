#!/bin/bash
# Version 0.1

#
# Shell custom
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#            zsh installation             #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo 'Change auth...'
sudo sed -i 's/auth       required   pam_shells.so/auth       sufficient   pam_shells.so/g' /etc/pam.d/chsh

echo 'Refresh auth...'
sudo /usr/sbin/pam-auth-update

sudo apt-get install -y fonts-powerline
sudo apt-get install -y zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME"/.oh-my-zsh
cp "$HOME"/.oh-my-zsh/templates/zshrc.zsh-template "$HOME"/.zshrc

echo 'Change theme...'
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' "$HOME"/.zshrc

echo 'Change shell...'
sudo chsh -s "$(command -v zsh)" "$USER"

echo 'Change auth...'
sudo sed -i 's/auth       sufficient   pam_shells.so/auth       required   pam_shells.so/g' /etc/pam.d/chsh

echo 'Refresh auth...'
sudo /usr/sbin/pam-auth-update

echo "
#
# Composer
#
alias composer='/usr/local/bin/composer'

#
# PHP-CS-FIXER
#
alias php-cs-fixer='$HOME/.composer/vendor/bin/php-cs-fixer'

#
# PHP code sniffer
#
alias phpcs='$HOME/.composer/vendor/bin/phpcs'
alias phpcbf='$HOME/.composer/vendor/bin/phpcbf'

#
# PHP Mess Detector
#
alias phpmd='/usr/local/bin/phpmd.phar'

#
# PHP Copy/Paste Detector
#
alias phpcpd='/usr/local/bin/phpcpd'" >>"$HOME"'/.zshrc'

# shellcheck source=HOME/.zshrc
source "$HOME"'/.zshrc'

sudo chmod -R 755 "$HOME"'/.oh-my-zsh'
