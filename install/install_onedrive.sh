#!/bin/bash

set -e
set -x

# Exits if onedrive has been installed.
if type onedrive > /dev/null 2>&1 
then
	exit
fi

# Adds a repo.
echo "" | sudo add-apt-repository ppa:yann1ck/onedrive
sudo apt-get update

# Installs onedrive.
sudo apt-get install onedrive

# Authorization.
echo -e "\a"
onedrive

# Automatic sync.
systemctl --user enable onedrive
systemctl --user start onedrive

whereis onedrive
