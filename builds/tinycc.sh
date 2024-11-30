#!/bin/bash -e

cd /mnt/src/sources/tinycc/

env CFLAGS="-Os -pipe -march=native" \
    CC="/mnt/src/gcc-toolchain/bin/gcc" \
    LDFLAGS="-s -static -g0 -L/mnt/lib -I/mnt/include -w" \
    AR="/mnt/src/gcc-toolchain/bin/ar"  \
    RANLIB="/mnt/src/gcc-toolchain/bin/ranlib" \
./configure --config-musl --disable-rpath --enable-static \
--prefix=/ --sysincludepaths="/mnt/lib/tcc/include:/mnt/include:/lib/tcc/include:/include" \
--libpaths="/mnt/lib:/mnt/lib/tcc:/lib:/lib/tcc" --crtprefix="/mnt/lib:/lib" \
--cross-prefix="/mnt" --cc="/src/gcc-toolchain/bin/gcc -L/mnt/lib -I/mnt/include -w -s -static -g0" \
--ar="/src/gcc-toolchain/bin/ar"

make -j$(nproc)
make DESTDIR="/mnt" install
make distclean

cd -
