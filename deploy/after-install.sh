#!/usr/bin/env bash
set -e

# move to app home directory
sudo cd /root/mecab-ko-dic

## clean
sudo make clean

## configure
sudo ./configure

## build user dic
sudo tools/add-userdic.sh

## build
sudo make
sudo make install