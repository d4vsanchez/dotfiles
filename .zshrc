export PATH=$HOME/.cargo/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 13

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
    brew
    docker
    fnm
    gitfast
    poetry
    poetry-env
    pyenv
    rust
    forgit
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Load fnm
eval "$(fnm env --use-on-cd)"

# Starship
eval "$(starship init zsh)"
