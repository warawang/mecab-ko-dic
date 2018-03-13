#!/usr/bin/env bash
set -e

export PATH=$PATH:/usr/local/bin

# move to app home directory
cd /home/ec2-user/mecab-ko-dic

## configure
./autogen.sh
./configure

## build user dic
tools/add-userdic.sh

## 동의어 사전 복사
cp -rf synoym/synoym.txt /etc/elasticsearch/analysis/synonym.txt

## build
make
make install