# Kevin's custom Zsh prompt theme

# PROMPT = '[%*] %n:%2~$(git_prompt_info) : '
PROMPT='[%w] %{$fg[red]%}%n%{$reset_color%} %{$fg[cyan]%}%2~%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%}: '

# Concatenate the following to PROMPT to display username and hostname
# Courtesy of Steve Losh 
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# %{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%}

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
