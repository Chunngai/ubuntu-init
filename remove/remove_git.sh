#!/bin/bash

set -e
set -x

if type git > /dev/null 2>&1
then
	sudo apt-get remove -y --purge git git-man
	sudo apt-get -y autoremove
fi
