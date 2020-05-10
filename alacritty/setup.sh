#!/bin/sh

mkdir -p $HOME/.config/alacritty
full_path="$HOME/.config/alacritty/alacritty.yml"
if [ -e "$full_path" ]; then
  preserved="$full_path.$$"
  mv "$full_path" "$preserved"
  echo "Preserved $full_path as $preserved"
fi
cp alacritty.yml "$full_path"
