#!/bin/bash
SCRIPT=$(realpath -s "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
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
  golang nodejs openjdk-17-jdk openjdk-17-jre
nvm_version=$(git ls-remote --sort=version:refname --tags https://github.com/nvm-sh/nvm.git | tail -n1 | sed 's/.*\/\([^$^]*\).*/\1/')
echo "Installing nvm ${nvm_version}..."
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${nvm_version}/install.sh" | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node --default
echo "Setting fish as the default shell..."
chsh -s /usr/bin/fish
echo "Copying dotfiles..."
"${SCRIPTPATH}/symlink-dotfiles.sh"
echo "Setting up vim..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qa
(cd ~/.vim/plugged/YouCompleteMe && python3 install.py --all)
echo "Setting up python tools..."
curl -sSL https://install.python-poetry.org | python3 -
pip install black ruff mypy
echo "Installing npm tools..."
npm install -g jsonlint
npm install -g fixjson
npm install -g htmlhint
npm install -g jshint
npm install -g prettier
npm install -g stylelint
npm install -g stylelint-config-standard
