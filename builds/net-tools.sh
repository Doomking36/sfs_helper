#!/bin/sh -e 

cd /mnt/src/sources/net-tools/

env CC="/mnt/src/gcc-toolchain/bin/gcc -L/mnt/lib -I/mnt/include -w" \
    LDFLAGS="-s -static -g0" CFLAGS="-Os -pipe -march=native" \
    AR="/mnt/src/gcc-toolchain/bin/ar" RANLIB="/mnt/src/gcc-toolchain/bin/ranlib" \
    make -j2

# Run env.sh once more

cd -
