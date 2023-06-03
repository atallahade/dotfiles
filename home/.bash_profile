#!/bin/bash
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
export SHELL=/usr/bin/fish
exec /usr/bin/fish
