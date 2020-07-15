#!/bin/bash

set -e
set -x

#sudo apt-get remove -y --purge vim vim-common vim-runtime
#sudo apt-get -y autoremove

#sudo apt-get remove -y --purge git git-man
#sudo apt-get -y autoremove

#sudo apt-get remove -y --purge python-pip-whl python3-pip
#sudo apt-get -y autoremove

if type atom > /dev/null 2>&1
then
	sudo apt-get remove -y --purge atom
	sudo apt-get -y autoremove
fi

if dpkg -l | grep baidunetdisk > /dev/null 2>&1
then
	sudo apt-get remove -y --purge baidunetdisk
	sudo apt-get -y autoremove
fi

if type google-chrome > /dev/null 2>&1
then
	sudo apt-get remove -y --purge google-chrome-stable
	sudo apt-get -y autoremove
fi

if type ffmpeg > /dev/null 2>&1
then
	sudo apt-get remove -y --purge ffmpeg
	sudo apt-get -y autoremove
fi

if type lantern > /dev/null 2>&1
then
	sudo apt-get remove -y --purge lantern
	sudo apt-get -y autoremove
fi

if type onedrive > /dev/null 2>&1
then
	sudo apt-get remove -y --purge onedrive
	sudo apt-get -y autoremove
	sudo rm -rf ~/.config/onedrive
fi

if type pycharm-community > /dev/null 2>&1
then
	sudo snap remove pycharm-community
fi

if type vmware > /dev/null 2>&1
then
	echo "" | sudo vmware-installer -u vmware-workstation
fi

