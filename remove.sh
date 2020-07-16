#!/bin/bash

set -e
set -x

BASE_PATH=$(cd `dirname $0`; pwd)

sh $BASE_PATH/remove/remove_vim.sh
sh $BASE_PATH/remove/remove_git.sh
sh $BASE_PATH/remove/remove_pip.sh

sh $BASE_PATH/remove/remove_atom.sh
sh $BASE_PATH/remove/remove_baidunetdisk.sh
sh $BASE_PATH/remove/remove_chrome.sh
sh $BASE_PATH/remove/remove_ffmpeg.sh
sh $BASE_PATH/remove/remove_lantern.sh
sh $BASE_PATH/remove/remove_onedrive.sh
sh $BASE_PATH/remove/remove_pycharm.sh
sh $BASE_PATH/remove/remove_vmware.sh
