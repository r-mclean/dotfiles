source "$XDG_CONFIG_HOME/zsh/aliases"
setopt AUTO_PARAM_SLASH

autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source $DOTFILES/zsh/external/completion.zsh
fpath=($ZDOTDIR/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup
#source "$XDG_CONFIG_HOME/zsh/external/spaceship/spaceship.zsh"

# Push the current directory visited onto the stack
setopt AUTO_PUSHD
# Do not store dulicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack aftr pushd or popd
setopt PUSHD_SILENT

bindkey -v
export KEYTIMEOUT=1

autoload -Uz cursor_mode && cursor_mode

source $DOTFILES/zsh/external/bd.zsh
source $DOTFILES/zsh/scripts.sh

# set up fzf
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# start i3 at login
source $XDG_CONFIG_HOME/i3/start_i3

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# setup pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
