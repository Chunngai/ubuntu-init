#!/bin/bash

set -e
set -x

if type vim > /dev/null 2>&1
then
	sudo apt-get remove -y --purge vim vim-common vim-runtime
	sudo apt-get -y autoremove
fi
