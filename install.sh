#!/bin/bash -x

function link()
{
    ln -sf "${PWD}/$1" "$HOME/.$1"
}

# Directories
[ ! -e ~/.conky/ ] && link conky

# files
link tmux.conf
link bashrc
link vimrc 
link gitignore
link gitconfig
link conkyrc
