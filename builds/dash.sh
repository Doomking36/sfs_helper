#!/bin/sh

env CC="/mnt/bin/tcc -s -static -g0" \
    LDFLAGS="-s -static -g0" \
    AR="/mnt/bin/tcc -ar" \
    RANLIB="echo" ./configure --prefix="/" --disable-fnmatch \
    --disable-lineno --disable-glob

make -j($nproc)
make DESTDIR="/mnt/" install
mv /mnt/bin/dash /mnt/bin/sh
make distclean
