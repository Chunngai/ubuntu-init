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
	pip3 install --timeout 180 --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple/ $pkg
done

sudo apt-get install -y python3-tk
