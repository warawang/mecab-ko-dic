#!/usr/bin/env bash
set -e

# move to app home directory
sudo sh -c "cd /root/mecab-ko-dic"

## configure
./configure

## build user dic
tools/add-userdic.sh

## build
make
make install