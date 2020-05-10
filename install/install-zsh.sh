#!/bin/sh

# Install zsh
sudo apt install zsh

echo "Now installing oh-my-zsh..."

# Install the dependencies of oh-my-zsh: git and curl
# (curl may have been already installed in the system, that's why we keep with it)
sudo apt install git curl

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
