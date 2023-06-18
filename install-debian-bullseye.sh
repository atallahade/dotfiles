#!/bin/bash
echo "Installing packages..."
sudo apt update && sudo apt upgrade -y
# Common tools
sudo apt install -y fish tmux vim htop curl bash-completion git ripgrep man fd-find
mkdir -p  ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
# Python
sudo apt install -y python3 python3-venv python3-pip
curl https://pyenv.run | bash
# YouCompleteMe requirements
sudo apt install -y build-essential cmake vim-nox python3-dev mono-complete \
  golang nodejs openjdk-17-jdk openjdk-17-jre npm
echo "Setting fish as the default shell..."
chsh -s /usr/bin/fish
echo "Copying dotfiles..."
./symlink-dotfiles.sh
echo "Setting up vim..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qa
(cd ~/.vim/plugged/YouCompleteMe && python3 install.py --all)
echo "Setting up python tools..."
curl -sSL https://install.python-poetry.org | python3 -
pip install black ruff mypy
echo "Installing npm tools..."
sudo npm install -g jsonlint
sudo npm install -g fixjson
sudo npm install -g htmlhint
sudo npm install -g js-beautify
