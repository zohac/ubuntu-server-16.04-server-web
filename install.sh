#!/bin/bash
# Version 0.1

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
NORMAL="\e[39m"

FULL_DIR=$PWD'/'$(dirname "$0")

# Retrieving parameters
RESPONSE=''
if [ "$1" ]; then

  case "$1" in
  Y | y | N | n)
    RESPONSE="$1"
    ;;
  *)
    echo -e "$YELLOW"'Les paramètres autorisés sont Y|y|N|n.'"$NORMAL"
    exit 1
    ;;
  esac

fi

echo -e "$GREEN"'  _       __     __                         '
echo -e "$GREEN"' | |     / /__  / /________  ____ ___  ___  '
echo -e "$GREEN"' | | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \ '
echo -e "$GREEN"' | |/ |/ /  __/ / /__/ /_/ / / / / / /  __/ '
echo -e "$GREEN"' |__/|__/\___/_/\___/\____/_/ /_/ /_/\___/  '
echo ''
echo -e "$GREEN"'Installing Apache2/PHP7.3/MySQL for a development web server on ubuntu server.'
echo ''
echo ''
echo -e "$NORMAL"

echo -e "$BLUE"'Update...'"$NORMAL"
sudo apt-get -y update
echo -e "$BLUE"'Installation of Dialog...'"$NORMAL"
sudo apt-get install -y dialog

DIALOG="${DIALOG=dialog}"
TEMP_FILE=$(mktemp 2>/dev/null) || TEMP_FILE=/tmp/test$$
# https://mywiki.wooledge.org/SignalTrap#Traps.2C_or_Signal_Handlers
trap 'rm -f '"$TEMP_FILE" EXIT HUP INT SIGTRAP TERM

"$DIALOG" --backtitle "Choisissez les composants à installer" \
--title "Choisissez les composants à installer" --clear \
--checklist "Selectionner les composants avec la barre espace" 25 80 16 \
"update" "Mise à jour" ON \
"dependencies" "Installation des dépendances" ON \
"apache2" "Installation du serveur http" ON \
"mysql" "Installation de la base de donnée" ON \
"php7.2" "Installation de php7.2" ON \
"php7.3" "Installation de php7.3" ON \
"php7.4" "Installation de php7.4" ON \
"symfony" "Installation du binaire de symfony" ON \
"xdebug" "Outil de debugage et profilage pour php" ON \
"composer" "Manager de dépendance pour php" ON \
"php-cs-fixer" "PHP Coding Standards Fixer" ON \
"php-code-sniffer" "PHP Code sniffer" ON \
"php-mess-detector" "PHP Mess Detector" ON \
"copy-paste-detector" "Détecteur de code copier/coller" ON \
"samba" "Partage de fichiers dans un réseau local" OFF \
"zsh" "Installation du shell zsh" ON \
"nodejs" "Installation de NodeJS et NPM" ON \
"yarn" "Installation de yarn" ON \
"add-virtualhost" "Installation du script d'ajout de virtualhost pour apache2" ON \
"cleaning" "Nettoyage de l'installation" ON 2>"$TEMP_FILE"
DIALOG_RESPONSE="$?"
CHOICE=$(cat "$TEMP_FILE")

#       "blackFire" "Solution de management de performance pour php" ON \

case "$DIALOG_RESPONSE" in
0)
  # Convert CHOICE into ARRAY
  IFS=' ' read -r -a ARRAY_CHOICE <<<"$CHOICE"
  # get length of ARRAY_CHOICE
  length=${#ARRAY_CHOICE[@]}

  # Use bash for loop
  for ((i = 0; i < "$length"; i++)); do
    # shellcheck source=SCRIPTDIR/dependencies/*_installation.sh
    source "$FULL_DIR"/dependencies/"${ARRAY_CHOICE[$i]}"_installation.sh
  done
  ;;
1)
  echo "Appuyé sur Annuler."
  ;;
255)
  echo "Appuyé sur Echap."
  ;;
esac

clear

echo -e "$GREEN"' _____         __                    '
echo -e "$GREEN"'/__  /  ____  / /_  ____ ______      '
echo -e "$GREEN"'  / /  / __ \/ __ \/ __ `/ ___/      '
echo -e "$GREEN"' / /__/ /_/ / / / / /_/ / /__        '
echo -e "$GREEN"'/____/\____/_/ /_/\__,_/\___/  web server installation script...is now installed!'
echo ''
echo ''
echo -e "$NORMAL"

while :; do

  if [ "$RESPONSE" = '' ]; then
    read -p "You should restart [Y/n] ? " RESPONSE
  fi

  case "$RESPONSE" in
  N | n)
    echo -e "$YELLOW"'Remember to restart !'"$NORMAL"
    break
    ;;
  Y | y)
    #Reboot
    sudo reboot
    break
    ;;
  *)
    echo -e "$RED"'Error, you had to answer yes[Y] or no[n].'"$NORMAL"
    RESPONSE=''
    ;;
  esac

done

exit 0
