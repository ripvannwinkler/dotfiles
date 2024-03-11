DOTFILES=$(realpath "$0")
DOTFILES=$(dirname "$DOTFILES")

echo "Using dotfiles from $DOTFILES"

ln -s "$DOTFILES/bash/.bash_aliases" ~/.bash_aliases
ln -s "$DOTFILES/git/.gitconfig" ~/.gitconfig
ln -s "$DOTFILES/vim/.vimrc" ~/.vimrc
ln -s "$DOTFILES/vim/" ~/.vim

echo "Dotfiles installed to $(realpath ~/)"
