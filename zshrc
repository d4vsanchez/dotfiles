# Add Cargo
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Remove any value existing in the ZSH_THEME
# We use starship for that
unset ZSH_THEME

# Change autoupdate behavior
# Update automatically without asking
zstyle ":omz:update" mode auto
# Update every 7 days
zstyle ":omz:update" frequency 7

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugin configuration
plugins=(asdf dotenv gitfast poetry ripgrep rust)

source $ZSH/oh-my-zsh.sh

# Set language of the environment
export LANG=en_US.UTF-8

# Set default editor
export EDITOR="lvim"
alias vim="lvim"
alias nvim="lvim"

# Initialize starship prompt
eval "$(starship init zsh)"

alias ll="ls -alF"
alias la="ls -A"
alias l="ls -F"

alias ssh-keygen="ssh-keygen -t ed25519"

alias free="free -h"
alias df="df -h"
alias top="htop"

alias myip="curl ipinfo.io"

# Replace GNU-utils with Rust-based utils
[[ -x "$(command -v fd)" ]] && alias find="fd"
[[ -x "$(command -v btm)" ]] && alias top="btm"
[[ -x "$(command -v rg)" ]] && alias grep="rg"
[[ -x "$(command -v bat)" ]] && alias cat="bat"
[[ -x "$(command -v exa)" ]] && alias ls="exa"

# Git aliases
alias gs="git status -s -b"
alias gc="git commit -v"
alias g.="git add -p"
alias gd="git diff"
alias gp="git checkout -p"
alias gr="git rebase"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias gal="git add --all"

# Load extra aliases
if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi
