#!/bin/sh -e

cd /mnt/src/sources/sbase/

env CC="/mnt/bin/tcc -s -static -g0" \
    CFLAGS="-Os -march=native -pipe -s -static -g0" \
    LDFLAGS="-s -static -g0" \
    AR="/mnt/bin/tcc -ar" \
    RANLIB="echo" make -e -j$(nproc)
    
make -e PREFIX="/" DESTDIR="/mnt/" install
ln -sf xinstall /mnt/bin/install
make clean

cd -
