#!/bin/bash

set -e
set -x

# Exits if baidunetdisk has been installed.
if dpkg -l | grep baidunetdisk > /dev/null 2>&1
then
	exit
fi

# Moves the pkg to `pwd` if one is provided.
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
	TAR_BALL=~/Downloads/baidunetdisk*deb
	wget http://issuecdn.baidupcs.com/issue/netdisk/LinuxGuanjia/3.0.1/baidunetdisk_linux_3.0.1.2.deb -P ~/Downloads
fi

# Installation.
sudo dpkg -i $TAR_BALL

dpkg -l | grep baidunetdisk
