#!/usr/bin/env fish

alias ls exa

fish_vi_key_bindings

set -px PATH /usr/local/bin /usr/sbin $HOME/.cargo/bin $HOME/bin $HOME/.local/bin
set -x FZF_LEGACY_KEYBINDINGS 0
set -x VISUAL nvim
set -x WLR_NO_HARDWARE_CURSORS 1
set -x DO_NOT_TRACK 1

set -x GOPATH ~/go
set -x RUST_BACKTRACE 1

source /home/catnip/.ghcup/env

function r
  touch $HOME/.rangerdir
  ranger --choosedir=$HOME/.rangerdir $argv
  set LASTDIR (cat $HOME/.rangerdir)
  cd $LASTDIR
  rm $HOME/.rangerdir
end

function uninstall
  sudo pacman -R (pacman -Qqe | fzf)
end

starship init fish | source
