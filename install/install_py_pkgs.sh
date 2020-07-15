#!/bin/bash

set -e
set -x

pkgs=(
	setuptools

	numpy
	matplotlib
	pandas
	jupyterlab

	nltk
	torch
	torchtext
	torchvision

	requests
	bs4
	selenium
	lxml

	itchat
	pdf2image

	#scipy
	#scikit-learn
	#tensorflow
	#opencv
	#baidu-aip
)

for pkg in ${pkgs[@]}
do
	if ! `python3 -c "import $pkg"` > /dev/null
	then
		pip3 install --timeout 180 --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple/ $pkg
	fi
done

if ! `python3 -c "import tkinter"` > /dev/null
then
	sudo apt-get install -y python3-tk
fi
