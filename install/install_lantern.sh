#!/bin/bash

set -e
set -x

# Exits if lantern has been installed.
if type lantern > /dev/null 2>&1
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
	TAR_BALL=lantern*deb
	cd ~/Downloads
	wget https://bitbucket.org/getlantern/lantern-binaries/raw/master/lantern-installer-64-bit.deb	
fi

# Installation.
sudo dpkg -i $TAR_BALL

whereis lantern
