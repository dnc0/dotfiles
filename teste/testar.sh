#!/usr/bin/env bash

sudo userdel -r tt
sudo useradd -m tt
sudo passwd tt
sudo cp -r /home/work/projetos/dotfiles /home/tt
echo "tt login"
su fat
