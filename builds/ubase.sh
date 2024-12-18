#!/bin/sh -e

cd /mnt/src/sources/ubase/

env CPPFLAGS="-D_FILE_OFFSET_BITS=64 -D_XOPEN_SOURCE=700 -D_GNU_SOURCE" \
    CC="/mnt/bin/tcc -s -static -g0" \
    CFLAGS="-Os -march=native -pipe -s -static -g0" \
    LDFLAGS="-s -static -g0" \
    AR="/mnt/bin/tcc -ar" \
    RANLIB="echo" make -e -j$(nproc)
    
make -e PREFIX="/" DESTDIR="/mnt/" install
make clean

cd -
