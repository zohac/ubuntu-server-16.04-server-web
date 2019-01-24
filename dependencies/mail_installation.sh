#!/bin/bash
# Version 0.1

#
# Installation Postfix
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#         Postfix installation            #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$BLUE"'Install mailutils...'"$NORMAL"
sudo apt-get install -y mailutils

echo -e "$BLUE"'Install postfix...'"$NORMAL"
sudo apt-get install -y postfix

dpkg-reconfigure postfix

echo -e "$BLUE"'Install dovecot-imapd...'"$NORMAL"
sudo apt-get install -y dovecot-imapd

echo -e "$BLUE"'Install dovecot-pop3d...'"$NORMAL"
sudo apt-get install -y dovecot-pop3d