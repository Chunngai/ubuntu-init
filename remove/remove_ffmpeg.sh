#!/bin/bash

set -e
set -x

if type ffmpeg > /dev/null 2>&1
then
	sudo apt-get remove -y --purge ffmpeg
	sudo apt-get -y autoremove
fi

