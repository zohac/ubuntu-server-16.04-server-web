#!/bin/bash
# Version 0.1

#
# Composer
#
echo -e "$GREEN"
echo ''
echo '###########################################'
echo '#          Composer installation          #'
echo '###########################################'
echo ''
echo ''
echo -e "$NORMAL"

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "
if (hash_file('SHA384', 'composer-setup.php') ===
    '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') {
        echo 'Installer verified';
    } else {
            echo 'Installer corrupt'; unlink('composer-setup.php');
    } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin
php -r "unlink('composer-setup.php');"
sudo chown "$USER":"$USER" /usr/local/bin/composer.phar
sudo chown -R "$USER":"$USER" .composer

echo "
#
# Composer
#
alias composer='/usr/local/bin/composer.phar'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc

exit 0;