#!/bin/bash

set -e
set -x

if type pycharm-community > /dev/null 2>&1
then
	sudo snap remove pycharm-community
fi
