#!/bin/bash
# Version 0.1

#
# Installation de samba
#
echo -e "$GREEN"
echo ''
echo '###########################################'
echo '#                  SAMBA                  #'
echo '###########################################'
echo ''
echo ''
echo -e "$NORMAL"

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
