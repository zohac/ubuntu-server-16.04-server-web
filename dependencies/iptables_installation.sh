#!/bin/bash
# Version 0.1

echo ''
echo -e "$GREEN"'###########################################'
echo -e "$GREEN"'#           vsftpd installation           #'
echo -e "$GREEN"'###########################################'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$BLUE"'Install iptables...'"$NORMAL"
sudo apt-get install -y iptables

sudo cp "$HOME/.inc/templates/firewall.sh" "/etc/init.d/firewall"

sudo chmod +x /etc/init.d/firewall
sudo update-rc.d firewall defaults
