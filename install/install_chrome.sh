#!/bin/bash

set -e
set -x

# Exits if chrome has been installed.
if type google-chrome > /dev/null 2>&1
then
	exit
fi

# Adds the repo.
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update

# Installs chrome.
sudo apt-get -y install google-chrome-stable

# Modifies google-chrome.list in /etc/apt/sources.list.d to avoid repeated configuration.
BASE_PATH=$(cd `dirname $0`; pwd)
sudo cp $BASE_PATH/support/google-chrome.list /etc/apt/sources.list.d/google-chrome.list

# Copies the bookmark to ~/.config/google-chrome/Default/, if provided.
eval set -- $(getopt -o b: -- "$@")

while [ -n $1 ]
do
	case $1 in
		-b)
			if [ ! -d ~/.config/google-chrome/Default ]
			then
				google-chrome  # .config/google-chrome is created after the first launch of chrome.
			fi
			cp $2 ~/.config/google-chrome/Default/Bookmarks
			shift 
			;;
		--)
			shift
			break
			;;
	esac

	shift
done

whereis google-chrome-stable
