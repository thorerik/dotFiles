#!/usr/bin/env bash

function link_config()
{
    ln -sf "${PWD}/config/$1" "$HOME/.$1"
}

function xdg_link_config()
{
    [ ! -e ~/.config ] && mkdir ~/.config

    ln -sf "${PWD}/config/$1" "$HOME/.config/$1"
}

function link_bin()
{
   [ ! -e ~/bin ] && mkdir ~/bin
   ln -sf "${PWD}/bin/$1" "$HOME/bin/$1"
}

# Directories
[ ! -e ~/.conky/ ] && link_config conky
[ ! -e ~/.ncmpcpp/ ] && link_config ncmpcpp
[ ! -e ~/.config/nvim ] && xdg_link_config nvim
[ ! -e ~/.config/i3 ] && xdg_link_config i3

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
link_config zshrc
link_config dir_colors
link_config tmux.conf
link_config bashrc
link_config vimrc
link_config gitignore
link_config gitconfig
link_config conkyrc
link_config i3status.conf
link_config Xmodmap
xdg_link_config liquidpromptrc

link_bin nrk
link_bin screenshot
link_bin start_x
