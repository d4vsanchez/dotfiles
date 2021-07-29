export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="crush"

plugins=(evalcache git git-extras node npm)

source $ZSH/oh-my-zsh.sh

_evalcache rbenv init -
eval "$(pyenv init --path)"

export EDITOR='nvim'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Git aliases
# Thanks @strager (https://github.com/strager/dotfiles/blob/master/zsh/strager/strager_define_git_scm_aliases)
alias gs="git status -s -b"
alias gc="git commit -v"
alias g.="git add -p"
alias gd="git diff"
alias gp="git checkout -p"
alias gr="git rebase"
alias grc="git rebase --continue"
alias gal="git add --all"
alias ga="git commit --amend --reuse-messsage=HEAD"

alias vim="nvim"
alias ssh-keygen="ssh-keygen -t ed25519"
alias free="free -h"
alias df="df -h"
alias ipinfo="curl ipinfo.io"

# Replace default Coreutils with Rust tools
[[ -x "$(command -v fd)" ]] && alias find="fd"
[[ -x "$(command -v btm)" ]] && alias htop="btm"
[[ -x "$(command -v rg)" ]] && alias grep="rg"
[[ -x "$(command -v bat)" ]] && alias cat="bat"
[[ -x "$(command -v sd)" ]] && alias sed="sd"
[[ -x "$(command -v exa)" ]] && alias ls="exa"
