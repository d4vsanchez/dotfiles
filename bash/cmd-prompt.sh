# This is a simple prompt I made for the colorscheme I use daily which is Gruvbox Medium Dark

export rightarrow=$'\302\273'

if [[ $EUID == 0 ]]; then
  export PS1="\[\u@\w\] # "
else
  export PS1="\[\e]0;\u@: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\$ "
fi
