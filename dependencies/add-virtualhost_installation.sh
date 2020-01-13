#!/bin/bash
# Version 0.1

FULL_DIR=$PWD'/'$(dirname "$0")

echo -e "$BLUE"'Installing the script...'"$NORMAL"
cp -r "$FULL_DIR"'/inc/' "$HOME"'/.inc/'

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
