#!/bin/bash

set -e
set -x

ARGS=`getopt -o h --long atom,baidunetdisk::,chrome::,ffmpeg,lantern::,onedrive,pycharm,vmware: -- "$@"`
eval set -- $ARGS

while true
do
	case $1 in
		--atom)
			ATOM=1
			shift
			;;
		--baidunetdisk)
			case $2 in
				"")
					BAIDUNETDISK=1
					shift 2
					;;
				*)  # Should be placed after *) or a infinite loop will be formed.
					BAIDUNETDISK=1
					eval BAIDUNETDISK_PKG=$2  # eval is needed to eval ~/
					shift 2
					;;
			esac
			;;
		--chrome)
			case $2 in 
				"")
					CHROME=1
					shift 2
					;;
				*)
					CHROME=1
					eval CHROME_BOOKMARKS=$2
					shift 2
					;;
			esac
			;;
		--ffmpeg)
			FFMPEG=1
			shift
			;;
		--lantern)
			case $2 in
				"")
					LANTERN=1
					shift 2
					;;
				*)
					LANTERN=1
					eval LANTERN_PKG=$2
					shift 2
					;;
			esac
			;;
		--onedrive)
			ONEDRIVE=1
			shift
			;;
		--pycharm)
			PYCHARM=1
			shift
			;;
		--vmware)
			VMWARE=1
			eval VMWARE_PKG=$2
			shift 2
			;;
		-h)
			echo "atom,baidunetdisk::,chrome::,ffmpeg,lantern::,onedrive,pycharm,vmware:"
			exit
			;;
		--)
			shift
			break
			;;
	esac
done

# ------ Preparation. ------

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

# ------ Installation. ------

# Changes the source into aliyun & tuna so that following installations can be faster.
#sudo cp /etc/apt/sources.list.aliyun-tuna /etc/apt/sources.list
#sudo apt-get update
#sudo apt-get -y upgrade

# Installs vim.
if type vim > /dev/null 2>&1
then
	sudo apt-get remove -y --purge vim-common vim-tiny
	sudo apt-get -y install vim
fi

# Installs pip3.
if type pip3 > /dev/null 2>&1
then
	sudo apt-get -y install python3-pip
	sh install/install_py_pkgs.sh  # Installs python pkgs
fi

# Installs git.
if type git > /dev/null 2>&1
then
	sudo apt-get -y install git
	sh init_git.sh
fi

# Changes the source into the original one.
#sudo cp /etc/apt/sources.list.ubuntu /etc/apt/sources.list
#sudo apt-get update
#sudo apt-get -y upgrade

# ------ Installation. ------
if [ $ATOM ]
then
	sh install/install_atom.sh
fi

if [ $BAIDUNETDISK ]
then
	if [ ! $BAIDUNETDISK_PKG ]
	then
		sh install/install_baidunetdisk.sh
	else
		sh install/install_baidunetdisk.sh -f $BAIDUNETDISK_PKG
	fi
fi

if [ $CHROME ]
then
	if [ ! $CHROME_BOOKMARKS ]
	then
		sh install/install_chrome.sh
	else
		sh install/install_chrome.sh -b $CHROME_BOOKMARKS
	fi
fi

if [ $FFMPEG ] 
then
	sh install/install_ffmpeg.sh
fi

if [ $LANTERN ] 
then
	if [ ! $LANTERN_PKG ]
	then
		sh install/install_lantern.sh
	else
		sh install/install_lantern.sh -f $LANTERN_PKG
	fi
fi

if [ $ONEDRIVE ]
then
	sh install/install_onedrive.sh
fi

if [ $PYCHARM ]
then
	sh install/install_pycharm_from_snap.sh
fi

if [ $VMWARE ]
then
	sh install/install_vmware.sh -f $VMWARE_PKG
fi
