#!/bin/bash

set -e
set -x

if type virtualenv > /dev/null 2>&1 -a type virtualenvwrapper > /dev/null 2>&1
then
	exit
fi

sudo apt install -y python3-pip
pip3 install setuptools
pip3 install virtualenv
pip3 install virtualenvwrapper

mkdir $HOME/.virtualenvs

BASHRC=~/.bashrc
echo "export WORKON_HOME=$HOME/.virtualenvs" >> $BASHRC
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> $BASHRC
echo "export VIRTUALENVWRAPPER_VIRTUALENV=~/.local/bin/virtualenv" >> $BASHRC
echo "source ~/.local/bin/virtualenvwrapper.sh" >> $BASHRC

echo -e "\a"
echo 'run `source ~/.bashrc`'
