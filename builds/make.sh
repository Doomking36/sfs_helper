#!/bin/sh -e

cd /mnt/src/packages/make*/

env CC="/mnt/bin/tcc -s -static -g0" \
    LDFLAGS="-s -static -g0" \
    AR="/mnt/bin/tcc -ar" \
    RANLIB="echo" LD="echo" ./configure --prefix="/" --disable-nls --disable-rpath \
    --bindir=/bin --sbindir=/bin --libexecdir=/bin --without-gnu-ld

make -j$(nproc)
make DESTDIR="/mnt/" install
make distclean

cd -
