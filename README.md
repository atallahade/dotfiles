# My dotfiles

## Usage

Assuming we start from a fresh install:
```bash
sudo apt-get update; sudo apt install -y git; git clone https://github.com/atallahade/dotfiles.git ~/.dotfiles
~/.dotfiles/install-debian-bullseye.sh
```

After setting up ssh keys:
```bash
(cd ~/.dotfiles; git remote set-url origin git@github.com:atallahade/dotfiles.git)
```
