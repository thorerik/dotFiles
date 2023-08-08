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
[ ! -e ~/.config/yabai ] && xdg_link_config yabai
[ ! -e ~/.config/sketchybar ] && xdg_link_config sketchybar
[ ! -e ~/.config/kitty ] && xdg_link_config kitty

# Deps
if hash git 2>/dev/null; then
    if [ -d ~/.zgen ]; then
        # if Zgen is installed, ensure that it generates a new loader
        rm ~/.zgen/init.zsh
    else
        # install Zgen
        git clone https://github.com/tarjoilija/zgen.git ~/.zgen
    fi

    if [ ! -d ./sketchybar/plugins/Dynamic-Island-Sketchybar ]; then
        # install Dynamic Island
        git clone https://github.com/crissNb/Dynamic-Island-Sketchybar.git ~/.config/sketchybar/plugins/Dynamic-Island-Sketchybar
    fi
else
    echo >&2 "Git is not installed, zgen and Dynamic Island not installed."
fi

# files
link_config allowed_signers
link_config zshrc
link_config dir_colors
link_config tmux.conf
link_config bashrc
link_config vimrc
link_config gitignore
link_config gitconfig
link_config Xmodmap


echo "#####################"
echo "##   Add GPG key   ##"
echo "#####################"
echo "gpg --full-generate-key"
echo "gpg --import gpg/github.gpg"
echo "gpg --expert --edit-key 5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23 trust"
echo "gpg --expert --edit-key 5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23 sign"
