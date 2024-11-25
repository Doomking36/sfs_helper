#!/bin/sh

env CC="/mnt/bin/tcc -s -static -g0" \
    LDFLAGS="-s -static -g0" \
    AR="/mnt/bin/tcc -ar" \
    RANLIB="echo" ./configure --prefix=/
make -j($nproc)
make DESTDIR="/mnt/" install
make distclean
