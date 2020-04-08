#!/usr/bin/env bash

sudo userdel -r fat
sudo useradd -m fat
sudo passwd fat
sudo cp -r /home/work/projetos/dotfiles /home/fat
su fat
