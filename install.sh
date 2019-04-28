#!/bin/bash
DIR=pwd
cd $(dirname $(readlink -f $0))
/bin/ln -Tsv $(pwd)/vim/vim ~/.vim
/bin/ln -sv $(pwd)/vim/vimrc ~/.vimrc
/bin/ln -sv $(pwd)/tmux/tmux.conf ~/.tmux.conf
/bin/ln -sv $(pwd)/git/gitconfig ~/.gitconfig
cd fish
for file in $(find . -type f)
do
  mkdir -p $(dirname ~/.config/fish/$file)
  /bin/ln -sv $(pwd)/$file  ~/.config/fish/$(dirname $file)
done
cd ..
cd $DIR
