#!/bin/bash

set -e
set -x

BASE_PATH=$(cd `dirname $0`; pwd)
ROOT_PATH=`dirname $BASE_PATH`

ARGS=`getopt -o h --long pypkgs,atom,baidunetdisk::,chrome::,ffmpeg,lantern::,onedrive,pycharm,vmware: -- "$@"`
eval set -- $ARGS

while true
do
	case $1 in
		-h)
			echo "atom,baidunetdisk::,chrome::,ffmpeg,lantern::,onedrive,pycharm,vmware:"
			exit
			;;
		--pypkgs)
			PYPKGS=1
			shift
			;;
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
sudo cp $ROOT_PATH/sources/sources.list.aliyun-tuna /etc/apt/sources.list.aliyun-tuna
# cp ubuntu source of the current ver to /etc/apt
UBUNTU_SOURCES_LIST=$ROOT_PATH/sources/sources.list.`lsb_release -i -s`_`lsb_release -r -s`
if [ -f $UBUNTU_SOURCES_LIST ]
then
	sudo cp $UBUNTU_SOURCES_LIST /etc/apt/sources.list.Ubuntu
else
	echo -e "\a"
	echo "sources.list.`lsb_release -i -s`_`lsb_release -r -s` not found."
	exit
fi

# ------ Installation. ------

# Changes the source into aliyun & tuna so that following installations can be faster.
#sudo cp /etc/apt/sources.list.aliyun-tuna /etc/apt/sources.list
#sudo apt-get update
#sudo apt-get -y upgrade

# Installs vim.
sh $ROOT_PATH/install/install_vim.sh

# Installs pip3.
sh $ROOT_PATH/install/install_pip3.sh

# Installs git.
sh $ROOT_PATH/install/install_git.sh

# Changes the source into the original one.
#sudo cp /etc/apt/sources.list.Ubuntu /etc/apt/sources.list
#sudo apt-get update
#sudo apt-get -y upgrade

# ------ Installation. ------
if [ $PYPKGS ]
then
	sh $ROOT_PATH/install/install_py_pkgs.sh
fi

if [ $ATOM ]
then
	sh $ROOT_PATH/install/install_atom.sh
fi

if [ $BAIDUNETDISK ]
then
	if [ ! $BAIDUNETDISK_PKG ]
	then
		sh $ROOT_PATH/install/install_baidunetdisk.sh
	else
		sh $ROOT_PATH/install/install_baidunetdisk.sh -f $BAIDUNETDISK_PKG
	fi
fi

if [ $CHROME ]
then
	if [ ! $CHROME_BOOKMARKS ]
	then
		sh $ROOT_PATH/install/install_chrome.sh
	else
		sh $ROOT_PATH/install/install_chrome.sh -b $CHROME_BOOKMARKS
	fi
fi

if [ $FFMPEG ] 
then
	sh $ROOT_PATH/install/install_ffmpeg.sh
fi

if [ $LANTERN ] 
then
	if [ ! $LANTERN_PKG ]
	then
		sh $ROOT_PATH/install/install_lantern.sh
	else
		sh $ROOT_PATH/install/install_lantern.sh -f $LANTERN_PKG
	fi
fi

if [ $ONEDRIVE ]
then
	sh $ROOT_PATH/install/install_onedrive.sh
fi

if [ $PYCHARM ]
then
	sh $ROOT_PATH/install/install_pycharm_from_snap.sh
fi

if [ $VMWARE ]
then
	sh $ROOT_PATH/install/install_vmware.sh -f $VMWARE_PKG
fi
