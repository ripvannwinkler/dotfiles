DOTFILES=$(realpath "$0")
DOTFILES=$(dirname "$DOTFILES")

echo "Using dotfiles from $DOTFILES"

ln -nfs "$DOTFILES/bash/.bash_aliases" ~/.bash_aliases
ln -nfs "$DOTFILES/git/.gitconfig" ~/.gitconfig
ln -nfs "$DOTFILES/vim/.vimrc" ~/.vimrc
ln -nfs "$DOTFILES/vim/" ~/.vim

echo "Dotfiles installed to $(realpath ~/)"
