#!/usr/bin/env bash

function link()
{
    ln -sf "${PWD}/$1" "$HOME/.$1"
}

# Directories
[ ! -e ~/.conky/ ] && link conky
[ ! -e ~/.ncmpcpp/ ] && link ncmpcpp

# files
link zshrc
link dir_colors
link tmux.conf
link bashrc
link vimrc 
link gitignore
link gitconfig
link conkyrc
