#!/bin/bash

sudo yum -y install openssl

cd /usr/local/src/

sudo wget https://www.kernel.org/pub/software/scm/git/git-2.28.0.tar.gz
sudo tar xzvf git-2.28.0.tar.gz
sudo rm -rf git-2.28.0.tar.gz
cd git-2.28.0

sudo make prefix=/usr/local all
sudo make prefix=/usr/local install
