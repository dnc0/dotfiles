#!/usr/bin/env bash
: '
dotfiles installer

'
#======= constants =======
readonly OHMYZSH_DOWNLOAD_LINK="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
#======= variables =======
#======= flags =======
flag_ok_ohmyzsh=0
flag_make_copy=0 #copy the config files
flag_make_xinit=0 #create the .xinitrc file
flag_make_menu=0 #create a new menu file
#======= functions ======= 
function backup(){
	#create a backup of current config files
	if [ -e  $HOME/.zshrc ];then
		cp -v $HOME/.zshrc $HOME/.zshrc.bak
	fi
	if [ -e  $HOME/.bashrc ];then
		cp -v $HOME/.bashrc $HOME/.bashrc.bak
	fi
	if [ -e  $HOME/.vimrc ];then
		cp -v $HOME/.vimrc $HOME/.vimrc.bak
	fi
	if [ -e  $HOME/.tmux.conf ];then
		cp -v $HOME/.tmux.conf $HOME/.tmux.conf.bak
	fi
	if [ -e  $HOME/.xinitrc ];then
		cp -v $HOME/.xinitrc $HOME/.xinitrc.bak
	fi
}

function copy(){
	#install ohmyzsh
	echo "download ohmyzsh..."
	if command -v wget 1>>/dev/null 2>>/dev/null ;then
		#wget -O $HOME/install_ohmyzsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
		eval wget -q -O $HOME/install_ohmyzsh.sh "$OHMYZSH_DOWNLOAD_LINK"
		chmod +x $HOME/install_ohmyzsh.sh 
	elif command -v curl 1>>/dev/null 2>>/dev/null ;then
		eval curl -S --show-error $OHMYZSH_DOWNLOAD_LINK -o $HOME/install_ohmyzsh.sh
		chmod +x $HOME/install_ohmyzsh.sh 
	else
		echo "wget and curl is not installed"
		echo "cannot get OhMyZsh, ignoring..."
	fi

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
	cp -v xprofile $HOME/.xprofile
	cp -v -r cool-retro-term $HOME/.local/share/cool-retro-term
	if [ $flag_ok_ohmyzsh -eq 0 ];then
		echo "install ohmyzsh"
		$HOME/install_ohmyzsh.sh --unattended --keep-zshrc
	else
		echo "not installing ohmyzsh"
	fi
}

function mk_xinit(){
	echo "openbox-session" > $HOME/.xinitrc
}
function create_menu(){
	if command -v mmaker ;then
		eval  mmaker -vf OpenBox3
	else
		echo "error: menumaker(mmaker) is not installed"
	fi
}
function usage(){
	echo "dotfiles install script"
	echo "./install [options]"
	echo "options:"
	echo "	-b,--backup : backup of current config files"
	echo "	-i,--install : install configfiles"
	echo "	-m,--newmenu : create a new menu file"
	echo "	-x,--make-init : create .xinitrc file"
	echo " 	-h,--help : help information"
}

#======= start execution ======= 
while [ "$1" != "" ];do
	case $1 in
		-b | --backup )
			backup
			;;
		-i | --install )
			copy
			;;
		-x | --make-init )
			mk_xinit
			;;
		-h | --help )
			usage
			exit 0
			;;
		-m | --newmenu )
			create_menu
			;;
		* )
			echo "option \"$1\" not exist"
			exit 1
	esac
	shift
done