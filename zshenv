# export MANPATH="/usr/local/man:$MANPATH"

# Not sure what this does
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

# Load up Node Version Manager
export NVM_DIR="/Users/KHU/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

## rbenv
PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

## custom scripts
PATH="$PATH:$HOME/bin"

# Uninstalled May 8
## pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# PATH="$PYENV_ROOT/bin:$PATH"

## pyenv
# eval "$(pyenv init -)"
