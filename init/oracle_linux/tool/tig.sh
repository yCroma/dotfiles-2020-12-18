#!/bin/bash

git clone https://github.com/jonas/tig.git
cd tig
 
make prefix=/usr/local
sudo make install prefix=/usr/local
