#!/usr/bin/env bash

echo "removendo usuario.."
sudo userdel -r tt
echo "adicioando usuario"
sudo useradd -m tt
echo "senha para novo usuario "
sudo passwd tt
sudo cp -r /home/work/projetos/dotfiles /home/tt
echo "login do usuario"
su tt
