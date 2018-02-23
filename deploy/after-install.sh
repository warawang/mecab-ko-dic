#!/usr/bin/env bash
set -e

export PATH=$PATH:/usr/local/bin

# move to app home directory
cd /home/ec2-user/mecab-ko-dic

## configure
./autogen.sh

## build user dic
tools/add-userdic.sh

## build
make
make install