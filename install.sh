#!/bin/bash
PATH="$(dirname "$(which "$0")")"
/bin/ln -sv "$PATH/vim/vimrc" ~/.vimrc
/bin/ln -Tsv "$PATH/vim/vim" ~/.vim
