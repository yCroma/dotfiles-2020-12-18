#!/bin/bash

yum install -y ncurses-devel

git clone https://github.com/vim/vim.git
cd vim/src
make
