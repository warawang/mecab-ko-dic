#!/usr/bin/env bash
set -e

# move to app home directory
cd /root/mecab-ko-dic

## clean
make clean

## configure
./configure

## build user dic
tools/add-userdic.sh

## build
make
make install