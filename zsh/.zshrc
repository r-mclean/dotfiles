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
    # fzf is installed by pacman on Arch
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
elif [ -x "$DOTFILES/zsh/external/fzf/bin/fzf" ]; then
    export PATH="${PATH:+${PATH}:}$DOTFILES/zsh/external/fzf/bin"
    source "$DOTFILES/zsh/external/fzf/shell/completion.zsh"
    source "$DOTFILES/zsh/external/fzf/shell/key-bindings.zsh"
fi

# start i3 at login
source $XDG_CONFIG_HOME/i3/start_i3

if [ $(uname -s) != 'Darwin' ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source $XDG_CONFIG_HOME/zsh/external/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# setup pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
