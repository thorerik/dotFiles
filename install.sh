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

# Deps
if hash git 2>/dev/null; then
    if [ -d ~/.zgen ]; then
        # if Zgen is installed, ensure that it generates a new loader
        rm ~/.zgen/init.zsh    
    else
        # install Zgen
        git clone https://github.com/tarjoilija/zgen.git ~/.zgen
    fi
else 
    echo >&2 "Git is not installed, zgen not installed."
fi

# files
link zshrc
link dir_colors
link tmux.conf
link bashrc
link vimrc 
link gitignore
link gitconfig
link conkyrc
link i3status.conf
xdg_link liquidpromptrc
