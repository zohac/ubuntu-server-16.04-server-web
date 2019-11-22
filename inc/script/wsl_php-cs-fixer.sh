#!/bin/bash
# Version 0.1

# Retrieving parameters
RESPONSE=''
if [ "$1" ]; then

    UNIX_PATH=$(wslpath -a "$1")
    php-cs-fixer fix "$UNIX_PATH" --rules=@Symfony

fi
