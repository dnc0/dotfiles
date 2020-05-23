#!/usr/bin/env bash

rm /home/work/projetos/dotfiles.tar
tar -cf /home/work/projetos/dotfiles.tar /home/work/projetos/dotfiles
echo "removendo usuario..."
sudo userdel -r tt
echo "adicioando usuario"
sudo useradd -m tt
echo "senha para novo usuario "
sudo passwd tt
#sudo echo "git clone https://github.com/dnc0/dotfiles" > /home/tt/script.sh
sudo cp /home/work/projetos/dotfiles.tar /home/tt
sudo tar -xf /home/tt/dotfiles.tar -C /home/tt
echo "login do usuario"
su tt
