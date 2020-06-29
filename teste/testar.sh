#!/usr/bin/env bash

if [ -e "/home/work/projetos/dotfiles.tar" ];then
	rm /home/work/projetos/dotfiles.tar
fi
cd /home/work/projetos
#tar -cf /home/work/projetos/dotfiles.tar /home/work/projetos/dotfiles
tar -cf dotfiles.tar dotfiles
echo "removendo usuario..."
sudo userdel -r tt
echo "adicioando usuario"
sudo useradd -m tt
echo "senha para novo usuario "
sudo passwd tt
#sudo echo "git clone https://github.com/dnc0/dotfiles" > /home/tt/script.sh
eval "sudo tar -xf dotfiles.tar -C /home/tt"
#echo "login do usuario"
#su tt
echo "ok"
