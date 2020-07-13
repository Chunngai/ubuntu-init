#!/bin/bash

set -e
set -x

# Exits if atom has been installed.
if type atom > /dev/null 2>&1
then
	exit
fi

# Adds the repo.
echo "" | wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt-get update

# Installs atom.
sudo apt-get -y install atom

whereis atom
