#!/bin/bash -x

function link()
{
    ln -sf "${PWD}/$1" "$HOME/.$1"
}

# for linking entire directories in .config
function configLink()
{
	ln -sf "${PWD}/config/$1" "$HOME/.config/$1"
}

# for linking fish files (as fish creates the .config/fish/ folder with it's current pid when it's active)
function fishLink()
{
	ln -sf "${PWD}/config/fish/$1" "$HOME/.config/fish/$1"
}


# files
link tmux.conf
link bashrc
link vimrc 
link gitignore
link gitconfig
fishLink config.fish
