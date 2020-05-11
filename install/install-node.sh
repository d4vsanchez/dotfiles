#!/bin/sh

node_v=12

curl -sL "https://deb.nodesource.com/setup_$node_v.x" | sudo -E bash -
sudo apt-get install -y nodejs
