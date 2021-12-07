#! /bin/sh
cp .tmux.conf ~/.tmux.conf

mkdir -p ~/.config/nvim
cp nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/nvim/autoload
wget "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
mv plug.vim ~/.config/nvim/autoload/plug.vim

echo 'Start nvim and run :PlugInstall'

mkdir -p ~/.config/fish
cp fish/config.fish ~/.config/fish/config.fish
cp fish/functions/* ~/.config/fish/functions/

cp git/gitconfig ~/.gitconfig
