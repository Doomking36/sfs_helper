#!/bin/csh

sed 's/cc/tcc/' conf/Unix.mk > _
mv -f _ conf/Unix.mk

make -e -j($nproc)

cp ./inc/* /include/
cp ./build/libbearssl.a /lib/
cp ./build/brssl /bin/
cp ./build/obj/* /lib/

make clean
