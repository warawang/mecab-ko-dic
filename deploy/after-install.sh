#!/usr/bin/env bash
set -e
sudo -s

# move to app home directory
sudo sh -c "cd /root/mecab-ko-dic"

## clean
make clean

## configure
./configure

## build user dic
tools/add-userdic.sh

## build
make
make install