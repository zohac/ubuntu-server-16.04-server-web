#!/bin/bash
# Version 0.1

FULL_DIR=$PWD'/'$(dirname "$0")

echo -e "$BLUE"'Installing the script...'"$NORMAL"
cp -r "$FULL_DIR"'/../inc/' "$HOME"'/.inc/'
