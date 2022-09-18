# Git
alias gs="git status -s -b"
alias gc="git commit -v"
alias g.="git add -p"
alias gd="git diff"
alias grc="git rebase --continue"
alias gal="git add --all"
alias gco="git checkout"

# Miscellaneous
alias ipinfo="curl ipinfo.io"
alias ssh-keygen="ssh-keygen -t ed25519"

# Rust replacement of coreutils
[[ -x "$(command -v fd)" ]] && alias find="fd"
[[ -x "$(command -v btm)" ]] && alias htop="btm"
[[ -x "$(command -v rg)" ]] && alias grep="rg"
[[ -x "$(command -v bat)" ]] && alias cat="bat"
[[ -x "$(command -v sd)" ]] && alias sed="sd"
[[ -x "$(command -v exa)" ]] && alias ls="exa"
