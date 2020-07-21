#!/bin/bash

set -e
set -x

BASE_PATH=$(cd `dirname $0`; pwd)
ROOT_PATH=`dirname $BASE_PATH`

if ! type git > /dev/null 2>&1
then
        sudo apt-get -y install git
        sh $ROOT_PATH/init/init_git.sh
fi

