#!/bin/bash

# Gets info of the git account.
echo -e "\a"
read -p "input the user name of github: " USER_NAME
read -p "input the email of github: " USER_EMAIL

# Configuration.
git config --global user.name $USER_NAME
git config --global user.email $USER_EMAIL

# Changes the default editor from nano to vim.
git config --global core.editor vim

# Generates a ssh key.
ssh -T git@github.com
cd ~/.ssh
echo "" | ssh-keygen -t rsa -C $USER_EMAIL

# Displays the ssh key.
echo -e "\a"
echo -e "ssh key: \n\n"

cat ~/.ssh/id_rsa.pub

echo -e "\n\n"
read -p "press any key to continue" TMP
