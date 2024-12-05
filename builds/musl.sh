#!/bin/sh -e

cd /mnt/src/sources/musl/

env CFLAGS="-Os -march=native -pipe -s -static -g0" \
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
