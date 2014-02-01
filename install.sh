#!/bin/bash -x

function link()
{
    ln -sf "${PWD}/$1" "$HOME/.$1"
}

# Directories
[ ! -e ~/.conky/ ] && link conky

# files
link zshrc
link dir_colors
link tmux.conf
link bashrc
link vimrc 
link gitignore
link gitconfig
link conkyrc
