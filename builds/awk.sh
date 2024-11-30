#!/bin/sh -e

cd /mnt/src/sources/awk/

env HOSTCC="/mnt/bin/tcc -static" \
    AR="/mnt/bin/tcc -ar" \
    RANLIB="echo" \
    YACC="/mnt/bin/yacc -d -b awkgram" \
    CFLAGS="-Os -march=native -pipe -static" \
    LDFLAGS="-static" \
    CC="/mnt/bin/tcc -static" \
    make -e -j$(nproc)

strip -s ./a.out
mv ./a.out /mnt/bin/awk
make distclean

cd -
