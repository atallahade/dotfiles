# fisher to manage packages
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# Paths
set -gx PATH ~/.cargo/bin/ $PATH
set -gx PATH ~/bin/ $PATH
set -gx PATH /usr/local/osx-ndk-x86/bin $PATH

# OSX Rust Cross Compilation
set -gx PKG_CONFIG_ALLOW_CROSS 1

# Remove the MOTD
set fish_greeting

# vim as editor
set -x EDITOR vim
set -x VISUAL $EDITOR

# Output rg in less with colors
function rg
  /usr/bin/rg $argv -p | less -R
end

function s --wraps=ssh
  /usr/bin/ssh -A $argv
end

function fix-ssh
  export (tmux show-environment | grep \^SSH_AUTH_SOCK=)
end

abbr gap git add -p
