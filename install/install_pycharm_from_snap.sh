#!/bin/bash

set -e
set -x

# Exits if pycharm has been installed.
if type pycharm-community > /dev/null 2>&1
then
	exit
fi

# Installs pycharm.
sudo snap install pycharm-community --classic

sudo whereis pycharm-community
