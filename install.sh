#!/bin/sh
PATH="$(dirname "$(which "$0")")"
/bin/ln -sv "$PATH/vim/vimrc" ~/.vimrc
/bin/ln -Tsv "$PATH/vim/vim" ~/.vim
/bin/ln -sv "$PATH/tmux/.tmux.conf" ~/.tmux.conf
