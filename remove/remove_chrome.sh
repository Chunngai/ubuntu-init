#!/bin/bash

set -e
set -x

if type google-chrome > /dev/null 2>&1
then
	sudo apt-get remove -y --purge google-chrome-stable
	sudo apt-get -y autoremove
fi
