#!/bin/bash

if [ -x ~/.bash_it/install.sh ]; then
    echo "${HAPPY}Already installed.${END}";
else
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh
fi
