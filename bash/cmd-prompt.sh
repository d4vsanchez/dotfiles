# This is a simple prompt I made for the colorscheme I use daily which is Gruvbox Medium Dark

export rightarrow=$'\302\273'

if [[ $EUID == 0 ]]; then
  export PS1="\[\u@\w\] # "
else
  export PS1="\e[0;49;94m\u@\w $rightarrow \e[m"
fi
