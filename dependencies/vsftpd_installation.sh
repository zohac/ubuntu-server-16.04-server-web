#!/bin/bash
# Version 0.1

echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#           vsftpd installation           #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$BLUE"'Install vsftpd...'"$NORMAL"
sudo apt-get install -y vsftpd

echo -e "$BLUE"'Install libpam-pwdfile...'"$NORMAL"
sudo apt-get install libpam-pwdfile

echo -e "$BLUE"'Update the configuration...'"$NORMAL"
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.org

echo "

#
# Virutal user settings
#
user_config_dir=/etc/vsftpd_user_conf
guest_enable=YES
virtual_use_local_privs=YES
pam_service_name=vsftpd
nopriv_user=vsftpd
guest_username=vsftpd" >> '/etc/vsftpd.conf'

sudo mkdir /etc/vsftpd

read -p "Nom de l'utilisateur à ajouter pour le ftp ? " USERNAME
sudo htpasswd -cd /etc/vsftpd/ftpd.passwd "$USERNAME"

sudo mv /etc/pam.d/vsftpd /etc/pam.d/vsftpd.old
sudo cat /etc/pam.d/vsftpd
echo "auth required pam_pwdfile.so pwdfile /etc/vsftpd/ftpd.passwd
account required pam_permit.so" | sudo tee -a '/etc/pam.d/vsftpd' > /dev/null

sudo useradd --home /home/vsftpd --gid www-data -m --shell /bin/false vsftpd
