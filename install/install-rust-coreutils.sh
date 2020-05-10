#!/bin/sh

if ! which cargo; then
  echo "Doesn't look like Rust/Cargo is installed in your sytem."
  echo "Be sure to install Rust with install-rust."
  exit 1
fi
cargo install bottom sd bat exa ripgrep fd-find

echo "INSTALLED :: Check the alias file in the root folder to replace default coreutils with these tools"
