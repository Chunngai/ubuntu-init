#!/bin/bash

set -e
set -x

if dpkg -l | grep baidunetdisk > /dev/null 2>&1
then
	sudo apt-get remove -y --purge baidunetdisk
	sudo apt-get -y autoremove
fi
