#!/bin/bash

if ! [ -x "$(command -v $1)" ]; then
    echo "tmuxinator not found. installing.."
    gem install tmuxinator
    tmuxinator doctor
	mkdir -p ~/.tmux/plugins
	cp -r ./.tmux/plugins/. ~/.tmux/plugins
	mkdir -p ~/.config/tmuxinator
	cp ./*.yml ~/.config/tmuxinator
else
    echo "$1 ${HAPPY}found.${END}"
fi

gemit "tmuxinator"
	tmuxinator doctor
	mkdir -p ~/.tmux/plugins
	cp -r ./tildy/.tmux/plugins/. ~/.tmux/plugins
	mkdir -p ~/.config/tmuxinator
	cp ./tildy/walrusk.yml ~/.config/tmuxinator