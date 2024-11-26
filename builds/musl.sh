#!/bin/sh

cd /mnt/src/packages/musl*/

env CFLAGS="-Os -pipe -march=native" \
    CC="/mnt/src/gcc-toolchain/bin/gcc" \
    LDFLAGS="-s -static -g0" \
    AR="/mnt/src/gcc-toolchain/bin/ar"  \
    RANLIB="/mnt/src/gcc-toolchain/bin/ranlib" \
./configure --prefix="/" --target=x86_64 \
            --syslibdir="/lib" --bindir="/bin" \
            --includedir="/include" \
            --disable-shared --enable-static

make -j$(nproc)
make DESTDIR="/mnt/" install
make distclean

cd -
