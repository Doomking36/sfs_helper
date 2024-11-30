#!/bin/csh

cd /src/sources/BearSSL/

make -e -j2

cp ./inc/* /include/
cp ./build/libbearssl.a /lib/
cp ./build/brssl /bin/
cp ./build/obj/* /lib/

make clean

cd -
