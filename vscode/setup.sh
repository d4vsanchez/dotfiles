#!/bin/sh

if ! which code; then
  echo "It seems that you don't have Visual Studio Code installed."
if

# Install the extensions
# Thanks to https://github.com/microsoft/vscode/issues/42994
cat extensions.list | xargs -L1 code --install-extension


# Set the configuration to the current user

# I use VSCode Insiders so I set the folder to Code - Insiders instead of Code
code_folder="Code - Insiders"

mkdir -p $HOME/.config/$code_folder/User
full_path="$HOME/.config/$code_folder/User/settings.json"
if [ -e "$full_path" ]; then
  preserved="$full_path.$$"
  mv "$full_path" "$preserved"
  echo "Preserved $full_path in $preserved"
fi
cp settings.json "$full_path"
