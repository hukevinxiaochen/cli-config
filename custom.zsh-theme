# Kevin's custom Zsh prompt theme

# Normal Prompt during login shell on local machine
# e.g. [Thu 26] KHU:~/cli-config(master) :
PROMPT='[%w] %n %F{white}%2~%f$(git_prompt_info) : '

# If we are logged in via SSH onto a remote machine
# e.g. [ [Thu 26] KHU:~/cli-config(master) ]:
if [ -n "$SSH_CLIENT" ]; then
  PROMPT='%B%F{black}[%f%b [%w] %n %m %F{white}%2~%f$(git_prompt_info) %B%F{black}]%f%b: '
fi

# Configure how git_prompt_info displays.
ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}("
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=")%f %F{red}✗%f"
ZSH_THEME_GIT_PROMPT_CLEAN=")%f"


# Concatenate the following to PROMPT to display username and hostname
# Courtesy of Steve Losh 
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# %{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%}
