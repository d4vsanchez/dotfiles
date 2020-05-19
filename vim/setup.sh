#!/bin/sh
if ! which nvim; then
  echo "Doesn't look like Neovim is installed in your system."
  exit 1
fi

mkdir -p $HOME/.config/nvim
ln -sf $PWD/vimrc $HOME/.config/nvim/init.vim
