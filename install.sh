#!/bin/sh
git clone https://github.com/vitormattos/vimrc.git ~/.vim-vm
mkdir -p ~/.vim-vm/vim/bundle
ln -s ~/.vim-vm/vimrc ~/.vimrc
ln -snf ~/.vim-vm/vim ~/.vim

git clone --depth 1 https://github.com/gmarik/Vundle.vim.git ~/.vim-vm/vim/bundle/Vundle.vim
vim +PluginInstall +qall

#vim-instant
sudo npm -g install instant-markdown-d
mkdir -p ~/.vim/after
curl -o ~/.vim/after/ftplugin/markdown/instant-markdown.vim https://github.com/suan/vim-instant-markdown/raw/master/after/ftplugin/markdown/instant-markdown.vim
