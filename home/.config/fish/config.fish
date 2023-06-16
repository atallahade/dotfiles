abbr gap git add -p

set -x EDITOR vim
set -x VISUAL $EDITOR

# Output rg in less with colors
function rgg --wraps=rg
  /usr/bin/rg $argv -p | less -R
end

# Remove the MOTD
set fish_greeting

set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

if test ! "$TERM" = "screen" && test ! "$TERM" = "tmux" && test -z "$TMUX"
  if tmux has-session
    tmux a
  else
    tmux
  end
end
