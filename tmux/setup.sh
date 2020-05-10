#!/bin/sh

if ! which tmux; then
  echo "Doesn't look like tmux is installed."
  echo "Be sure to intsall tmux with install-tmux."
  exit 1
fi

ln -sf "$PWD/tmux.conf" "$HOME/.tmux.conf"
