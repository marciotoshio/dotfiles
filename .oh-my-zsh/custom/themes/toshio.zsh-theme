function echo_blank() {
  echo
}

precmd_functions+=echo_blank

local bel=$(tput bel)
local ret_status="%(?:%{$fg_bold[green]%}➜ :$bel%{$fg_bold[red]%}✗ )"
local newline=$'\n'
PROMPT='[%n] | %{$fg[white]%}%w %*%{$reset_color%}${newline}${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
