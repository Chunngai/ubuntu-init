#/bin/bash

set -e
set -x

if type vmware > /dev/null 2>&1
then
	echo "" | sudo vmware-installer -u vmware-workstation
fi
