#!/usr/bin/env bash
newversion=$(date +%d/%m/%Y-%H%M)

function copy(){
	cp -v vimrc $HOME/.vimrc
	cp -v tmux.conf $HOME/.tmux.conf
	cp -v zshrc $HOME/.zshrc
	mkdir -p $HOME/.config/openbox
	cp -v -r openbox $HOME/.config/
	mkdir -p $HOME/.local/share/konsole
	cp -v -r konsole $HOME/.local/share
	cp -v konsolerc $HOME/.config
	mkdir -p $HOME/.config/conky/ 
	cp -v conky.conf $HOME/.config/conky
	cp -v -r xfce4 $HOME/.config/
	sudo chown -Rv $USER $HOME/.config/
}

function mk_xinit(){
	echo "openbox-session" >> $HOME/.xinitrc
}

#Inicio da execução

copy
mk_xinit
