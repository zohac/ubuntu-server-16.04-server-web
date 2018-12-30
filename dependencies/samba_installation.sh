#!/bin/bash
# Version 0.1

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
NORMAL="\e[39m"

#
# Installation de samba
#
echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#                  SAMBA                  #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$GREEN"'Installation of samba'"$NORMAL"
sudo apt-get install -y samba

sudo -s <<eof
echo "
[share]
comment = share
path = $HOME
writeable = yes
guest ok = yes
create mask = 0644
directory mask = 0755
force user = $USER" >> /etc/samba/smb.conf
eof

sudo service smbd restart
