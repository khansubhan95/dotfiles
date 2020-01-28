#!/usr/bin/env bash
#
# Usage: ./update.sh [pattern]
#
# Specify [pattern] to update only repos that match the pattern.

repos=(

  tpope/vim-pathogen
  jiangmiao/auto-pairs
  junegunn/goyo.vim
  itchyny/lightline.vim
  scrooloose/nerdtree
  ervandew/supertab
  tpope/vim-commentary
  tpope/vim-fugitive
  tpope/vim-repeat
  tpope/vim-surround
  tpope/vim-vinegar

)

set -e
dir=~/.dotfiles/.vim/bundle

if [ -d "$dir" -a -z "$1" ]; then
  if which trash &>/dev/null; then
    echo "▲ Moving old bundle dir to trash"
    trash "$dir"
  elif which gio &>/dev/null; then
    echo "▲ Moving old bundle dir to trash"
    gio trash "$dir"
  else
    temp="$(mktemp -d)"
    echo "▲ Moving old bundle dir to $temp"
    mv "$dir" "$temp"
  fi
fi

mkdir -p "$dir"

for repo in ${repos[@]}; do
  if [ -n "$1" ]; then
    if ! (echo "$repo" | grep -i "$1" &>/dev/null) ; then
      continue
    fi
  fi
  plugin="$(basename $repo | sed -e 's/\.git$//')"
  [ "$plugin" = "vim-styled-jsx" ] && plugin="000-vim-styled-jsx" # https://goo.gl/tJVPja
  dest="$dir/$plugin"
  rm -rf "$dest"
  (
    git clone --depth=1 -q "https://github.com/$repo" "$dest"
    rm -rf "$dest/.git"
    echo "· Cloned $repo"
    [ "$plugin" = "onehalf" ] && (mv "$dest" "$dest.TEMP" && mv "$dest.TEMP/vim" "$dest" && rm -rf "$dest.TEMP")
  ) &
done
wait
