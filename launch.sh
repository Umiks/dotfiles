# TODO: тут будет скрипт для развертывания конфигов
cd
mkdir .dotfiles_backup
cat .vimrc >> .dotfiles_backup/.vimrc
cat .gitconfig >> .dotfiles_backup/.gitconfig
cat .bash_profile >> .dotfiles_backup/.bash_profile
ln -s dotfiles/.vimrc
ln -s dotfiles/.gitconfig
ln -s dotfiles/.bash_profile
