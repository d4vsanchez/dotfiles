#!/bin/sh

# I use PyEnv as I need to have multiple Python versions.
# I'm sorry for that, hope one day I could be at latest without any hassle

py_36=3.6.12
py_37=3.7.9

sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

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
