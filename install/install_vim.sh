#!/bin/bash

set -e
set -x

if ! type vim > /dev/null 2>&1
then
        sudo apt-get remove -y --purge vim-common vim-tiny
        sudo apt-get -y install vim
fi

