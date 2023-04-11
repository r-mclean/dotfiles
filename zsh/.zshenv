# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config" 

# For specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# For cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="nvim"
export VISUAL="nvim"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"
# Max events for internal history
export HISTSIZE=10000
# Max events in history file
export SAVEHIST=10000

export DOTFILES="$HOME/dotfiles"
