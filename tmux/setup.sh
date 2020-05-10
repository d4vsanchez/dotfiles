#!/bin/sh

full_path="$HOME/.tmux.conf"
if [ -e "$full_path" ]; then
  preserved="$full_path.$$"
  mv "$full_path" "$preserved"
  echo "Preserved $full_path as $preserved"
fi
cp tmux.conf "$full_path"
