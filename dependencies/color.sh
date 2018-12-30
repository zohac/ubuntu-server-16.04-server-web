#!/bin/bash
# Version 0.1

RED=''
GREEN=''
YELLOW=''
BLUE=''
NORMAL=''

if test -t 1; then

    # see if it supports colors...
    ncolors=$(tput colors)

    if test -n "$ncolors" && test $ncolors -ge 8; then
        RED="\e[31m"
        GREEN="\e[32m"
        YELLOW="\e[33m"
        BLUE="\e[34m"
        NORMAL="\e[39m"
    fi
fi
