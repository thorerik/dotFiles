#!/usr/bin/env bash 

function link()
{
    ln -sf "${PWD}/$1" "$HOME/.$1"
}

function xdg_link()
{
    [ ! -e ~/.config ] && mkdir ~/.config

    ln -sf "${PWD}/$1" "$HOME/.config/$1"
}
# Directories
[ ! -e ~/.conky/ ] && link conky
[ ! -e ~/.ncmpcpp/ ] && link ncmpcpp
[ ! -e ~/.config/nvim ] && xdg_link nvim

# files
link zshrc
link dir_colors
link tmux.conf
link bashrc
link vimrc 
link gitignore
link gitconfig
link conkyrc
