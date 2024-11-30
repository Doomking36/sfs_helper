#!/bin/sh -e

cd /src/sources/BearSSL/

sed 's/cc/tcc/' conf/Unix.mk > _
mv -f _ conf/Unix.mk

make -e -j2

cp ./inc/* /include/
cp ./build/libbearssl.a /lib/
cp ./build/brssl /bin/
cp ./build/obj/* /lib/

make clean

cd -
