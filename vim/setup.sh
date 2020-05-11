#!/bin/sh
if ! which vim; then
  echo "Doesn't look like Vim is installed in your system."
  exit 1
fi

ln -sf $PWD/vimrc $HOME/.vimrc
