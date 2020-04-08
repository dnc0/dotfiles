#!/usr/bin/env bash
newversion=$(date +%d/%m/%Y-%H%M)

function copy(){
	cp -v vimrc $HOME/.vimrc
	cp -v tmux.conf $HOME/.tmux.conf
	cp -v zshrc $HOME/.zshrc
	cp -v -r openbox $HOME/.config
	cp -v -r konsole $HOME/.local/share
	cp -v konsolerc $HOME/.config
	cp -v conky.conf $HOME/.config/conk
	cp -v -r openbox $HOME/.config/xfce4/xfconf/xfce-perchannel-xml
}

#Inicio da execução

copy
