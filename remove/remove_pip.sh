#!/bin/bash

set -e
set -x

if type pip > /dev/null 2>&1
then
	sudo apt-get remove -y --purge python-pip-whl python3-pip
	sudo apt-get -y autoremove
fi
