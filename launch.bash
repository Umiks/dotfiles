#!/usr/bin/env bash

set -e

NEED_BASHRC=false
DOTFILES_DIR=`pwd`

#делаем все из корневой дирректории
cd ~

# если существует файл .bashrc(ubuntu) то нужно создать на него симлинку
if [ -e ".bashrc" ]; then
    NEED_BASHRC=true
fi


# Апаем плагины для вима
cd "$DOTFILES_DIR"
git clone https://github.com/gmarik/Vundle.vim "$DOTFILES_DIR/.vim/bundle/Vundle.vim"
vim +PluginInstall +qall

cd ~

mkdir .dotfiles_backup
[ -e ".vimrc" ] && .vimrc .dotfiles_backup/.vimrc
[ -e ".gitconfig" ] && mv .gitconfig .dotfiles_backup/.gitconfig
[ -e ".bash_profile" ] && mv .bash_profile .dotfiles_backup/.bash_profile

ln -s "$DOTFILES_DIR/.vimrc"
ln -s "$DOTFILES_DIR/.gitconfig"
ln -s "$DOTFILES_DIR/.bash_profile"


if [[ $NEED_BASHRC = true ]]; then
    ln -s .bash_profile .bashrc
fi
