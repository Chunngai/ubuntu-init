#!/bin/bash

set -e
set -x

if type onedrive > /dev/null 2>&1
then
	sudo apt-get remove -y --purge onedrive
	sudo apt-get -y autoremove
	sudo rm -rf ~/.config/onedrive
fi
