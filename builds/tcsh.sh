#!/bin/sh -e

cd /mnt/src/packages/tcsh*/

env CC="/mnt/bin/tcc -s -static -g0" \
    LDFLAGS="-s -static -g0" \
    CFLAGS="-Os -march=native -pipe -s -static -g0" \
    AR="/mnt/bin/tcc -ar" \
    RANLIB="echo" LIBS="-lcurses -lterminfo" ./configure --disable-rpath \
    --disable-nls --disable-nls-catalogs --prefix="/" --without-gnu-ld

make -j$(nproc)
make DESTDIR="/mnt/" install
ln -sf tcsh /mnt/bin/csh
make clean

#load /etc/profile script
cat << . > /mnt/root/.cshrc
source /etc/profile
.

cd -
