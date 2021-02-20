set bell-style none

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

# Do not duplicate lines or add lines that starts with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

