#!/usr/bin/env bash

function copy(){
	#install ohmyzsh
	echo "download ohmyzsh..."
	wget -O $HOME/install_ohmyzsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	chmod +x $HOME/install_ohmyzsh.sh 
	cp -v $HOME/.zshrc $HOME/.zshrc.bak
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
	cp -v -r xfce4-local $HOME/.local/share/xfce4
	#sudo chown -Rv $USER $HOME/.config/
	cp -v bashrc $HOME/.bashrc
	echo "install ohmyzsh"
	$HOME/install_ohmyzsh.sh --unattended --keep-zshrc
}

function mk_xinit(){
	echo "openbox-session" >> $HOME/.xinitrc
}

#Inicio da execução
copy
mk_xinit
