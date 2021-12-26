export CARGO_HOME="$HOME/.cargo"
export VOLTA_HOME="$HOME/.volta"
export PYENV_HOME="$HOME/.pyenv"
export POETRY_HOME="$HOME/.poetry"
export HOMEBREW_PATH="/usr/local/bin:/usr/local/sbin"

export PATH="$PATH:$CARGO_HOME/bin"
export PATH="$PATH:$PYENV_HOME/bin"
export PATH="$PATH:$VOLTA_HOME/bin"
export PATH="$PATH:$POETRY_HOME/bin"
export PATH="$PATH:$HOMEBREW_PATH"

# Add PyEnv to the ZSH path
eval "$(pyenv init --path zsh)"

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="crush"

plugins=(
  git
  git-extras
  node
  npm
  direnv
  poetry
)

source $ZSH/oh-my-zsh.sh

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
alias gco="git checkout"

alias df="df -h"
alias ipinfo="curl ipinfo.io"

# Replace default Coreutils with Rust tools
[[ -x "$(command -v fd)" ]] && alias find="fd"
[[ -x "$(command -v btm)" ]] && alias htop="btm"
[[ -x "$(command -v rg)" ]] && alias grep="rg"
[[ -x "$(command -v bat)" ]] && alias cat="bat"
[[ -x "$(command -v sd)" ]] && alias sed="sd"
[[ -x "$(command -v exa)" ]] && alias ls="exa"

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND="rg --files -g '!{Library,node_modules,.git,.svn,.hg,*.map,.idea,.vscode,.sass-cache,build,Pictures}'"
  export FZF_DEFAULT_OPTS="-m --height 50% --border"
fi
