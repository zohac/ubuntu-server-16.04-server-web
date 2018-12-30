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

echo -e "$BLUE"'Download the signature...'"$NORMAL"
EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"

echo -e "$BLUE"'Download the installer...'"$NORMAL"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

echo -e "$BLUE"'Calculating the signature...'"$NORMAL"
ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

echo -e "$BLUE"'Test of the signature...'"$NORMAL"
if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo -e "$RED"'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

echo -e "$BLUE"'Installation of composer...'"$NORMAL"
sudo php composer-setup.php --quiet --filename=composer --install-dir=/usr/local/bin
RESULT=$?
sudo rm composer-setup.php
sudo chown "$USER":"$USER" /usr/local/bin/composer

echo -e "$BLUE"'Version of composer...'"$NORMAL"
composer -V
sudo chown -R "$USER":"$USER" .composer

echo "
#
# Composer
#
alias composer='/usr/local/bin/composer'" >> "$HOME"/.bashrc
source "$HOME"/.bashrc

# exit $RESULT
