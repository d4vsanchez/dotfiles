#!/bin/sh

mkdir -p $HOME/.config/alacritty
full_path="$HOME/.config/alacritty/alacritty.yml"

if ! which alacritty; then
  echo "Doesn't look like Alacritty is installed."
  echo "Be sure to install Alacritty with install-alacritty."
  exit 1
fi

ln -f alacritty.yml "$HOME/.config/alacritty/alacritty.yml"

