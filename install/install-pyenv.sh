#!/bin/sh

# I use PyEnv as I need to have multiple Python versions.
# I'm sorry for that, hope one day I could be at latest without any hassle

py_36=3.6.10
py_37=3.7.7

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
exec $SHELL

pyenv_bin_path="$HOME/.pyenv/bin/pyenv"
if [ ! -f "$pyenv_bin_path" ]; then
  echo "PyEnv hasn't been installed in the system."
  exit 1
fi

pyenv install $py_36
pyenv install $py_37

pyenv global $py_36
