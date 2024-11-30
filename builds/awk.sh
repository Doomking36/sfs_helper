#!/bin/sh -e

cd /mnt/src/sources/awk/

env HOSTCC="/mnt/bin/tcc -s -static -g0" \
    AR="/mnt/bin/tcc -ar" \
    RANLIB="echo" \
    YACC="/mnt/bin/yacc -d -b awkgram" \
    CFLAGS="-Os -march=native -pipe -static" \
    LDFLAGS="-s -static -g0" \
    CC="/mnt/bin/tcc -s -static -g0" \
    make -e -j$(nproc)

strip -s ./a.out
mv ./a.out /mnt/bin/awk
make distclean

cd -
