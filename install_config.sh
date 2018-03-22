#!/bin/sh
CURRENT_DIR=`pwd`

# Moves old dirs, creating backups
if [ -f ~/.vimrc ]; then
	mv -f ~/.vimrc ~/.vimrc.bk
fi
if [ -d ~/.vim ]; then
	mv -f ~/.vim ~/.vim.bk
fi

# create simlinks for the current dir
ln -sf ${CURRENT_DIR}/.vimrc ~/.vimrc
ln -sf ${CURRENT_DIR}/.vim ~/.vim

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
