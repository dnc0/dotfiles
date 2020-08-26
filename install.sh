#!/usr/bin/env bash
: '
dotfiles installer

'
#======= constants =======
readonly OHMYZSH_DOWNLOAD_LINK="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
#======= variables =======
#======= flags =======
flag_ok_ohmyzsh=0
flag_install_ohmyzsh=1
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
function restore(){
	#restore config files from backup
	if [ -e  $HOME/.zshrc.bak ];then
		cp -v $HOME/.zshrc.bak $HOME/.zshrc
	fi
	if [ -e  $HOME/.bashrc.bak ];then
		cp -v $HOME/.bashrc.bak $HOME/.bashrc
	fi
	if [ -e  $HOME/.vimrc.bak ];then
		cp -v $HOME/.vimrc.bak $HOME/.vimrc
	fi
	if [ -e  $HOME/.tmux.conf.bak ];then
		cp -v $HOME/.tmux.conf.bak $HOME/.tmux.conf
	fi
	if [ -e  $HOME/.xinitrc.bak ];then
		cp -v $HOME/.xinitrc.bak $HOME/.xinitrc
	fi
}

function copy(){
	#copy all config files
	#install ohmyzsh
	if [ "$flag_install_ohmyzsh" -gt 0 ];then
		echo "download ohmyzsh..."
		if command -v wget 1>>/dev/null 2>>/dev/null ;then
			#wget -O $HOME/install_ohmyzsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
			eval wget -q -O $HOME/install_ohmyzsh.sh "$OHMYZSH_DOWNLOAD_LINK"
			flag_ok_ohmyzsh=$?
			chmod +x $HOME/install_ohmyzsh.sh 
		elif command -v curl 1>>/dev/null 2>>/dev/null ;then
			eval curl -S --show-error $OHMYZSH_DOWNLOAD_LINK -o $HOME/install_ohmyzsh.sh
			if [ -e "$HOME/install_ohmyzsh.sh" ];then
				flag_ok_ohmyzsh=0
				chmod +x $HOME/install_ohmyzsh.sh
			else
				flag_ok_ohmyzsh=1
			fi
		else
			echo "nor wget or curl is not installed,cannot get OhMyZsh, ignoring..."
		fi
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
	cp -rv geany $HOME/.config/
	if [ ! -e "$HOME/.config/termite" ];then
		eval mkdir -v "$HOME/.config/termite"
	fi
	cp -v termite.config "$HOME/.config/termite/config"
	cp -v Xdefaults "$HOME/.Xdefaults"
	if [ "$flag_install_ohmyzsh" -gt 0 ] && [ "$flag_ok_ohmyzsh" -eq 0 ];then
		echo "installing OhMyZsh"
		eval "$HOME/install_ohmyzsh.sh --unattended --keep-zshrc"
	else
		if [ "$flag_ok_ohmyzsh" -ne 0 ];then
			echo "error when obtain ohmyzsh"
		fi
	fi
}

function mk_xinit(){
	echo "creating xinitrc file with openbox"
	echo "openbox-session" > $HOME/.xinitrc
}
function create_menu(){
	if command -v mmaker 1>>/dev/null 2>>/dev/null ;then
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
	echo "	-r,--restore : restore old config files"
	echo "	-i,--install : install configfiles"
	echo "	-m,--newmenu : create a new menu file"
	echo "	-x,--make-init : create .xinitrc file"
	echo "	-z,--no-ohmyzsh : not install ohmyzsh"
	echo " 	-h,--help : help information"
}

#======= start execution ======= 
if [ "$1" = "" ];then
	echo "inform at least one option!"
	usage
	exit 0
fi
while [ "$1" != "" ];do
	case $1 in
		-h | --help )
			usage
			exit 0
			;;
		-b | --backup )
			backup
			;;
		-r | --restore )
			restore
			;;
		-z | --no-ohmyzsh )
			flag_install_ohmyzsh=0
			;;
		-i | --install )
			copy
			;;
		-x | --make-init )
			mk_xinit
			;;
		-m | --newmenu )
			create_menu
			;;
		* )
			echo "error: option \"$1\" not exist"
			exit 1
	esac
	shift
done