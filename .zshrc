export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.n/bin"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME='minimal'

plugins=(debian django docker git git-extras node npm npx zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# General aliases
alias browser='firefox'

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

alias ssh-keygen="ssh-keygen -t ed25519"
alias free="free -h"
alias df="df -h"
alias ipinfo="curl ipinfo.io"

# Replace default Coreutils with Rust tools
alias find="fd"
alias htop="btm"
alias grep="rg"
alias cat="bat"
alias sed="sd"
alias ls="exa"

unsetopt nomatch

# Tilix configuration
if [[ $TILIX_ID ]]; then
    source /etc/profile.d/vte.sh
fi
