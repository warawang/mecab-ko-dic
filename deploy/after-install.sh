#!/usr/bin/env bash
set -e

export PATH=$PATH:/usr/local/bin

# move to app home directory
cd /home/ec2-user/mecab-ko-dic

## configure
./configure

## build user dic
tools/add-userdic.sh

## build
make
sudo make install