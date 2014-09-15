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
if [ -d "$DOTFILES_DIR/.vim/bundle/Vundle.vim" ]; then
    rm -rf "$DOTFILES_DIR/.vim/bundle/Vundle.vim"
    git clone https://github.com/gmarik/Vundle.vim "$DOTFILES_DIR/.vim/bundle/Vundle.vim"
fi

cd ~

[ ! -d ".dotfiles_backup" ] && mkdir .dotfiles_backup

[ -e ".vimrc" ] && mv .vimrc .dotfiles_backup/.vimrc
[ -e ".gitconfig" ] && mv .gitconfig .dotfiles_backup/.gitconfig
[ -e ".bash_profile" ] && mv .bash_profile .dotfiles_backup/.bash_profile

ln -s "$DOTFILES_DIR/.vimrc"
ln -s "$DOTFILES_DIR/.gitconfig"
ln -s "$DOTFILES_DIR/.bash_profile"

vim +PluginInstall +qall

if [[ $NEED_BASHRC = true ]]; then
    [ -e ".bashrc" ] && mv .bashrc .dotfiles_backup/.bashrc
    ln -s .bash_profile .bashrc
fi
