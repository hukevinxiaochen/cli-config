# Kevin's custom Zsh prompt theme

# Normal Prompt during login shell on local machine
# e.g. [Thu 26] KHU:~/cli-config(master) :
PROMPT='%#|%n|%B%F{black}%3~%f%b-%F{blue}%w %T%f| $(git_prompt_info)'
OLD_PS1='[%w] %n %F{white}%2~%f $(git_prompt_info) : '

# If we are logged in via SSH onto a remote machine
# e.g. [ [Thu 26] KHU:~/cli-config(master) ]:
if [ -n "$SSH_CLIENT" ]; then
  PROMPT='%B%F{black}[%f%b %#|%n|%B%F{black}%3~%f%b-%F{blue}%w %T%f| $(git_prompt_info) %B%F{black}]%f%b:'
fi

# Configure how git_prompt_info displays.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=")%{$reset_color%} %F{red}✗%f"
ZSH_THEME_GIT_PROMPT_CLEAN=")%{$reset_color%}"

# Update prompt with vi mode with widget
# function zle-line-init zle-keymap-select {
#   VIM_PROMPT="%{$fg_bold[yellow]%}[% N]%{$reset_color%}"
#   PROMPT="${NEW_PS1}${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}:"
#   zle reset-prompt
# }
#  
# zle -N zle-line-init
# zle -N zle-keymap-select


# Concatenate the following to PROMPT to display username and hostname
# Courtesy of Steve Losh 
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# %{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%}
