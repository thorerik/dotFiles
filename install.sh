#!/bin/bash -x

function link()
{
    ln -sf "${PWD}/$1" "$HOME/.$1"
}


# files
link tmux.conf
