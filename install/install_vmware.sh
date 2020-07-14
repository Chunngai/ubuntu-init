#!/bin/bash

set -e
set -x

# Exits if vmware has been installed.
if type vmware > /dev/null 2>&1
then
	exit
fi

# Moves the pkg to `pwd`.
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

# Exits if no pkg is provided.
if [ ! $TAR_BALL ]
then
	echo "pkg needed!"
	echo "visit https://my.vmware.com/cn/web/vmware/downloads/info/slug/desktop_end_user_computing/vmware_workstation_pro/15_0 to get a pkg"
	exit
fi

# Installation.
chmod +x VMware*
sudo ./VMware* --console --eulas-agreed --required

# Displays license keys.
if [ -f ../vmware_license_key ] 
then
	cat ../vmware_license_key
fi

echo -e "\a"
vmware

whereis vmware
