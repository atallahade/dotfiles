# My dotfiles

## Usage

```bash
$ git clone --recursive git@github.com:atallahade/dotfiles.git ~/.dotfiles
$ ~/.dotfiles/install.sh
```

## Install vim plugins
```bash
$ vim +PluginInstall +qall
```

## Install YouCompleteMe for Rust

```bash
$ cd ~/.dotfiles/vim/vim/bundle/YouCompleteMe/
$ ./install.py --rust-completer
```
