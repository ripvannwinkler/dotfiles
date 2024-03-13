#!/usr/bin/env bash

DOTFILES=$(realpath "$0")
DOTFILES=$(dirname "$DOTFILES")

echo "Using dotfiles from $DOTFILES"

ln -ns "$DOTFILES/bash/.bash_aliases" ~/.bash_aliases
ln -ns "$DOTFILES/git/.gitconfig" ~/.gitconfig
ln -ns "$DOTFILES/vim" ~/.vim
ln -ns "$DOTFILES/vim/.vimrc" ~/.vimrc

echo "Dotfiles installed to $(realpath ~/)"
