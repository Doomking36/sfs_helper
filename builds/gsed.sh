#!/bin/sh

cd /mnt/src/packages/sed*/

env CC="/mnt/bin/tcc -s -static -g0" \
    LDFLAGS="-s -static -g0" \
    AR="/mnt/bin/tcc -ar" \
    RANLIB="echo" ./configure --prefix=/ --disable-nls --disable-rpath \
    --without-selinux

make -j$(nproc)
make DESTDIR="./GSED/" install
mv GSED/bin/sed /mnt/bin/gsed
mv GSED/share/man/man1/sed.1 /mnt/share/man/man1/gsed.1

rm -r ./GSED
make distclean

cd -
