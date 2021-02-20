alias code='code'
alias c='code'
alias browser='google-chrome'

[[ -x "$(command -v fd)" ]] && alias find="fd"
[[ -x "$(command -v btm)" ]] && alias htop="btm"
[[ -x "$(command -v rg)" ]] && alias grep="rg"
[[ -x "$(command -v bat)" ]] && alias cat="bat"
[[ -x "$(command -v sd)" ]] && alias sed="sd"
[[ -x "$(command -v exa)" ]] && alias ls="exa"

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

