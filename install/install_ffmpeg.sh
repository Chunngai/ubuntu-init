#!/bin/bash

set -e
set -x

# Exits if ffmpeg has been installed.
if type ffmpeg > /dev/null 2>&1
then
	exit
fi

# Installs ffmpeg.
sudo apt-get -y install ffmpeg

whereis ffmpeg
