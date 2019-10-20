#!/bin/bash
# Version 0.1

while :
do

    read -pr "Voulez-vous ajouter un hostname (www.exemple.com) [Y/n] ? " RESPONSE

    case "$RESPONSE" in
        N|n)
            break
        ;;
        Y|y)
            read -pr "Nom du hostname (www.exemple.com) : " HOSTNAME
            read -pr "Path du virtualhost 'DocumentRoot /dir/to/index.html' : " VIRTUAL_HOST_PATH

            sudo cp "$HOME/.inc/templates/apache2.conf" "/etc/apache2/sites-available/$HOSTNAME.conf"

            sed -i "s/# ServerName www.example.com/ServerName $HOSTNAME/g" "/etc/apache2/sites-available/$HOSTNAME.conf"
            sed -i "s/VIRTUAL_HOST_PATH/$VIRTUAL_HOST_PATH/g" "/etc/apache2/sites-available/$HOSTNAME.conf"

            break
        ;;
        *)
            echo -e "$RED"'Error, you had to answer yes[Y] or no[n].'"$NORMAL"
            RESPONSE=''
        ;;
    esac

    FILE="/mnt/c/windows/system32/wsl.exe"
    if [[ -f "$FILE" ]]; then

        read -pr "Utilisez-vous le wsl de windows 10 [Y/n] ? " RESPONSE

        case "$RESPONSE" in
            N|n)
                break
            ;;
            Y|y)
                read -pr "Voulez-vous ajouter $HOSTNAME à votre fichier host [Y/n] ? " RESPONSE

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
sudo service apache2 reload

echo "
#
# Add virtualhost
#
alias add-virtualhost='bash $HOME/.inc/script/add_virtualhost.sh'" >> "$HOME"'/.bashrc'

# shellcheck source=HOME/.bashrc
source "$HOME"'/.bashrc'

echo "
#
# Add virtualhost
#
alias add-virtualhost='bash $HOME/.inc/script/add_virtualhost.sh'" >> "$HOME"'/.zshrc'

# shellcheck source=HOME/.zshrc
source "$HOME"'/.zshrc'