#!/bin/sh

sed '514,517d' libcurses/color.c > _
mv -f _ libcurses/color.c

env CC="/mnt/bin/tcc -s -static -g0 -w" \
    AR="/mnt/src/gcc-toolchain/bin/ar" \
    LDFLAGS="-s -static -g0" make -j($nproc) all-static

make -e PREFIX="/" DESTDIR="/mnt/" LDFLAGS="-s -static -w -g0" install-static
make clean      