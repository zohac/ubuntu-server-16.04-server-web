#!/bin/bash
# Version 0.1

RED="\e[31m"
NORMAL="\e[39m"

while :
do

    read -p "Voulez-vous ajouter un hostname (www.exemple.com) [Y/n] ? " RESPONSE

    case "$RESPONSE" in
        N|n)
            break
        ;;
        Y|y)
            read -p "Nom du hostname (www.exemple.com) : " HOSTNAME
            read -rp "Path du virtualhost 'DocumentRoot /dir/to/index.html' : " VIRTUAL_HOST_PATH

            sudo cp "$HOME/.inc/templates/apache2.conf" "/etc/apache2/sites-available/$HOSTNAME.conf"

            sudo sed -i "s/# ServerName www.example.com/ServerName $HOSTNAME/g" "/etc/apache2/sites-available/$HOSTNAME.conf"
            sudo sed -i "s~VIRTUAL_HOST_PATH~$VIRTUAL_HOST_PATH~g" "/etc/apache2/sites-available/$HOSTNAME.conf"

            break
        ;;
        *)
            echo -e "$RED"'Error, you had to answer yes[Y] or no[n].'"$NORMAL"
            RESPONSE=''
        ;;
    esac

    FILE="/mnt/c/windows/system32/wsl.exe"
    if [[ -f "$FILE" ]]; then

        read -r "Utilisez-vous le wsl de windows 10 [Y/n] ? " RESPONSE

        case "$RESPONSE" in
            N|n)
                break
            ;;
            Y|y)
                read -p "Voulez-vous ajouter $HOSTNAME à votre fichier host [Y/n] ? " RESPONSE

                case "$RESPONSE" in
                    N|n)
                        break
                    ;;
                    Y|y)
                        echo "
                        #
                        # Add virtualhost for dev
                        #
                        127.0.0.1 $HOSTNAME" >> '/mnt/c/Windows/System32/drivers/etc/hosts'
                        break
                    ;;
                    *)
                        echo -e "$RED"'Error, you had to answer yes[Y] or no[n].'"$NORMAL"
                        RESPONSE=''
                    ;;
                esac

                break
            ;;
            *)
                echo -e "$RED"'Error, you had to answer yes[Y] or no[n].'"$NORMAL"
                RESPONSE=''
            ;;
        esac
    fi
done

sudo apache2ctl configtest
sudo a2ensite "$HOSTNAME"
sudo service apache2 reload

# shellcheck source=HOME/.zshrc
source "$HOME"'/.zshrc'
