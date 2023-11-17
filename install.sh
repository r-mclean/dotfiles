#!/bin/bash

# Do the common stuff first

#######
# nvim
#######
mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"
ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim"

[! -f "$DOTFILES/nvim/autoload/plug.vim" ] \
    && curl -fLo "$DOTFILES/nvim/autload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"

######
# zsh
######
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"

rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh/external"

######
# tmux
######
mkdir -p "$XDG_CONFIG_HOME/tmux"
mkdir -p "$XDG_CONFIG_HOME/tmuxp"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
[ ! -d "$XDG_CONFIG_HOME/tmux/plugins/tpm ] \
    && git clone https://github/tmux-plugins/tpm \
    "$XDG_CONFIG_HOME/tmux/plugins/tpm"

######
# i3 (this wont run on Mac)
######
rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

# Arch linux specific
case "$OSTYPE" in
    linux*)
    rm -rf "$XDG_CONFIG_HOME/X11"
    ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

    #######
    # fonts
    #######
    mkdir -p "$XDG_DATA_HOME"
    cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

    #######
    # dunst
    #######
    mkdir -p "$XDG_CONFIG_HOME/dunst"
    ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"
esac

# install neovim plugin manager
# install (or update) all of the plugins
nvim --noplugin +PlugUpdate +qaenv
