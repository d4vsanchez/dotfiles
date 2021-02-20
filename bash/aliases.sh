unalias -a

alias ls='ls -h --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ssh-keygen='ssh-keygen -t ed25519'

alias '?'=duck
alias '??'=google

alias free='free -h'
alias df='df -h'
alias top='htop'

alias ipinfo='curl ipinfo.io'

which vim &>/dev/null && alias vi=vim

alias vimpluginstall="nvim +':PlugInstall' +':q!' +':q!'"

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
