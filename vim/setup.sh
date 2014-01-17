#!/bin/bash
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall! +qall
cd bundle/YouCompleteMe && ./install
cd ../tern_for_vim && npm install
