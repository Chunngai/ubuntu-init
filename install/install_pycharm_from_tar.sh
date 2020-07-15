#!/bin/bash

set -e
set -x

# Exits if pycharm has been installed.
if type charm > /dev/null 2>&1
then
	exit
fi

# Moves the pkg to /opt if one is provided.
eval set -- $(getopt -o f: -- "$@")  # eval is needed or `basename $TAR_BALL` will leave a single quote at the end of the file name.

while [ -n $1 ]
do
	case $1 in 
		-f) 
			TAR_BALL=$2
			cp $TAR_BALL `pwd`/`basename $TAR_BALL`
			shift
			;;
		--) 
			shift
			break 
			;;
	esac

	shift
done

# Downloads a pkg if no pkg is provided.
if [ ! $TAR_BALL ]
then
	TAR_BALL=~/Downloads/pycharm-community*tar*
	wget https://download.jetbrains.8686c.com/python/pycharm-community-2019.3.1.tar.gz -P ~/Downloads
fi

# Expands the tar ball and moves it to /opt.
sudo tar -zxvf $TAR_BALL -C /opt

# Installs pycharm.
cd /opt/pycharm-community*/bin
echo -e "\a"
sudo ./pycharm.sh

# Makes the icon be able to be added to the stock.
cd /usr/share/applications
sudo touch jetbrains-pycharm-ce.desktop
sudo chmod 777 jetbrains-pycharm-ce.desktop
sudo echo "[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm Community Edition
Icon=/opt/pycharm-community-2019.3.1/bin/pycharm.svg
Exec="/opt/pycharm-community-2019.3.1/bin/pycharm.sh" %f
Comment=Python IDE for Professional Developers
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm-ce" >> jetbrains-pycharm-ce.desktop

sudo whereis charm
