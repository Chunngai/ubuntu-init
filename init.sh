#!/bin/bash

set -e
set -x

# Creates a log
# if [ ! -d "logs" ]
# then
# 	mkdir logs
# fi

# LOG="logs/init_"`date "+%m-%d"`".log"
# touch $LOG

# dash -> bash.
echo -e "\a"
sudo dpkg-reconfigure dash

# Removes games
sudo apt-get -y --purge remove aisleriot gnome-mahjongg gnome-mines gnome-sudoku 
# libgnome-games-support-1-3:amd64 libgnome-games-support-common gamemode libgamemode0 libgamemodeauto0 libgme0:amd64

# cp aliyun & tuna source to /etc/apt
sudo cp sources/sources.list.aliyun-tuna /etc/apt/sources.list.aliyun-tuna
# cp sources.list in /etc/apt to sources.list.ubuntu
sudo cp /etc/apt/sources.list /etc/apt/sources.list.ubuntu

# Changes the source into aliyun & tuna so that following installations can be faster.
sudo cp /etc/apt/sources.list.aliyun-tuna /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y upgrade

# Installs vim.
# sudo apt-get remove -y --purge vim-common vim-tiny
sudo apt-get -y install vim
# Installs pip3.
sudo apt-get -y install python3-pip
sh install/install_py_pkgs.sh  # Installs python pkgs
# Installs git.
sudo apt-get -y install git
sh init_git.sh

# Changes the source into the original one.
sudo cp /etc/apt/sources.list.ubuntu /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y upgrade


