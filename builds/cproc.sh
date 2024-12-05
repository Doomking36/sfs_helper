#!/bin/sh -e

cd /mnt/src/sources/cproc/

env CC="/mnt/bin/tcc -s -static -g0 -L/mnt/lib/ -I/mnt/include" \
    LDFLAGS="-s -static -g0" \
    AR="/mnt/bin/tcc -ar"  \
    RANLIB="echo" \
./configure --prefix=/

make -j$(nproc)
make DESTDIR="/mnt" install
make clean
