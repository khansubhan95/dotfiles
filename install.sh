#!/bin/bash

ln -sf ~/.dotfiles/.vim ~/.vim
ln -sf ~/.dotfiles/.bashrc  ~/.bashrc
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig

dir=~/.dotfiles/z

if [ -d "$dir" -a -z "$1" ]; then
  if which trash &>/dev/null; then
    echo "▲ Moving old z dir to trash"
    trash "$dir"
  elif which gio &>/dev/null; then
    echo "▲ Moving old z bundle dir to trash"
    gio trash "$dir"
  else
    temp="$(mktemp -d)"
    echo "▲ Moving old z bundle dir to $temp"
    mv "$dir" "$temp"
  fi
fi

git clone --depth=1 -q https://github.com/rupa/z  ~/.dotfiles/z/
source ~/.dotfiles/.vim/update.sh
