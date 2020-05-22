#!/usr/bin/env bash

echo "removendo usuario.."
sudo userdel -r tt
echo "adicioando usuario"
sudo useradd -m tt
echo "senha para novo usuario "
sudo passwd tt
sudo echo "git clone https://github.com/dnc0/dotfiles" > /home/tt/script.sh
sudo chmod o+x /home/tt/script.sh
echo "login do usuario"
su tt
