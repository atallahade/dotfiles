#!/bin/sh
PATH="$(dirname "$(which "$0")")"
/bin/ln -sv "$PATH/vim/vimrc" ~/.vimrc
/bin/ln -Tsv "$PATH/vim/vim" ~/.vim
vim +PluginInstall +qall
