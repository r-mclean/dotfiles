source "$XDG_CONFIG_HOME/zsh/aliases"
setopt AUTO_PARAM_SLASH

autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source $DOTFILES/zsh/external/completion.zsh
fpath=($ZDOTDIR/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup

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

if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
