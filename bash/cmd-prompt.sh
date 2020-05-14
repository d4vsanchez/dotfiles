# This is a simple prompt I made for the colorscheme I use daily which is Gruvbox Medium Dark

export rightarrow=$'\302\273'

if [[ $EUID == 0 ]]; then
  export PS1="\[\033[1;33m\]\u\[\033[0;00m\]@\[\033[0;34m\]\w\[\033[0;00m\] # "
else
  export PS1="\[\033[1;33m\]\u\[\033[0;00m\]@\[\033[0;34m\]\w\[\033[0;00m\] $rightarrow T "
fi
