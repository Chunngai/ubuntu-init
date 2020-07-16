#!/bin/bash

set -e
set -x

if type atom > /dev/null 2>&1
then
	sudo apt-get remove -y --purge atom
	sudo apt-get -y autoremove
fi
