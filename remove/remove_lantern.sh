#!/bin/bash

set -e
set -x

if type lantern > /dev/null 2>&1
then
	sudo apt-get remove -y --purge lantern
	sudo apt-get -y autoremove
fi
