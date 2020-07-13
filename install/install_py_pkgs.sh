#!/bin/bash

pkgs=(
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
	pdf2img

	#scipy
	#scikit-learn
	#tensorflow
	#opencv
	#baidu-aip
)

for pkg in ${pkgs[@]}
do
	pip3 install --default-timeout 60 --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple/ $pkg
done

sudo apt-get install -y python3-tk
