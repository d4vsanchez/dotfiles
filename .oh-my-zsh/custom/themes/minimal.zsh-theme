ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{%F{007}%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{%F{007}%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%} "

# Leave the prompt white
zle_highlight=( default:fg=white )

PROMPT='%F{004}%2~ $(git_prompt_info)»%{$reset_color%} '
