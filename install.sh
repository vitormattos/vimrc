#!/bin/sh
git clone https://github.com/vitormattos/vimrc.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
git clone --depth 1 https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
