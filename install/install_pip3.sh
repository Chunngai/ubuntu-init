#!/bin/bash

set -e
set -x

if ! type pip3 > /dev/null 2>&1
then
        sudo apt-get -y install python3-pip
fi

