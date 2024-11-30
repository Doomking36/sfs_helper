#!/bin/sh -e

cd /mnt/src/sources/netbsd*/

sed '514,517d' libcurses/color.c > _
mv -f _ libcurses/color.c

env CC="/mnt/bin/tcc -s -static -g0 -w" \
    CFLAGS="-Os -march=native -pipe -s -static -g0" \
    AR="/mnt/src/gcc-toolchain/bin/ar" \
    LDFLAGS="-s -static -g0" make -j$(nproc) all-static

make -e PREFIX="/" DESTDIR="/mnt/" LDFLAGS="-s -static -w -g0" install-static
make clean      

cd -
