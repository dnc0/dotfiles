#!/usr/bin/env bash
newversion=$(date +%d/%m/%Y-%H%M)


function backup(){
	sufix=$newversion
	echo "Fazendo backup dos arquivos de configuração"
	cp -v $HOME/.vimrc $HOME/.vimrc.$sufix
	cp -v $HOME/.zshrc $HOME/.zshrc.$sufix
	cp -v HOME/.tmux.conf $HOME/.tmux.conf.$sufix
	cp -v -r $HOME/.config/openbox $HOME/.config/openbox.$sufix
	cp -v $HOME/.config/konsolerc $HOME/.config/konsolerc.$sufix
	cp -v -r $HOME/.local/share/konsole $HOME/.local/share/konsole.$sufix
	cp -v $HOME/.config/conky/conky.conf $HOME/.config/conky/conky.conf.$sufix
	cp -v $HOME/.config/i3/config $HOME/.config/i3/config.$sufix
}

function restore(){
	echo "Restaurando arquivos de configuração"
	cp -v "$HOME/.vimrc.old $HOME/.vimrc"
	cp -v "$HOME/.zshrc.old $HOME/.zshrc"
	cp -v "$HOME/.tmux.conf.old $HOME/.tmux.conf"
	cp -v -r "$HOME/.config/openbox.backup $HOME/.config/openbox"
	cp -v "$HOME/.config/konsolerc.old $HOME/.config/konsolerc "
	cp -v -r "$HOME/.local/share/konsole.bak $HOME/.local/share/konsole "
	cp -v "$HOME/.config/conky/conky.conf.old $HOME/.config/conky/conky.conf"
	cp -v "$HOME/.config/i3/config.bak $HOME/.config/i3/config"
}

function copy(){
	echo "Instalando os arquivos..."
	mv -v "vimrc $HOME/.vimrc"
	mv -v "zshrc $HOME/.zshrc"
	mv -v "tmux.conf $HOME/.tmux.conf"
	mv -v -r "openbox $HOME/.config/"
	mv -v "konsolerc $HOME/.config/"
	mv -v -r "konsole $HOME/.local/share"
	mv -v "conky.conf $HOME/.config/conky/conky.conf"
	mv -v "i3config $HOME/.config/i3/config"
}

#Inicio da execução

copy
