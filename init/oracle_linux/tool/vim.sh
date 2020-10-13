#!/bin/bash
# 参考リンク
# https://gist.github.com/yevrah/21cdccc1dc65efd2a4712781815159fb

################################################################################
# Method 2: Install by building from scratch - contains a lot ot dependancies
#

# Setup essential build environment
sudo yum -y groupinstall "Development Tools"
sudo yum -y install ncurses-devel git-core

# Get source
git clone https://github.com/vim/vim && cd vim

# OPTIONAL: configure to provide a comprehensive vim - You can skip this step
#  and go  straight to `make` which will configure, compile and link with
#  defaults.

./configure --prefix=/usr --with-features=huge --enable-multibyte --with-python-config-dir=/usr/lib/python2.7/config --enable-pythoninterp=yes

# Build and install
make && sudo make install
