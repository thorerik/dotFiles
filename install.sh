#!/bin/bash -x

function link()
{
    ln -sf "${PWD}/$1" "$HOME/.$1"
}


# directory
[ ! -d ~/.config ] && link config

# files
link tmux.conf
link bashrc
link vimrc 
link gitignore
link gitconfig
