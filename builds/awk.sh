#!/bin/bash -e

cd /mnt/src/sources/awk/

env HOSTCC="/mnt/bin/tcc -s -static -g0" \
    AR="/mnt/bin/tcc -ar" \
    RANLIB="echo" \
    YACC="/mnt/bin/yacc -d -b awkgram" \
    CFLAGS="-Os -march=native -pipe" \
    LDFLAGS="-s -static" \
    CC="/mnt/bin/tcc" \
    make -e -j$(nproc)

strip -s ./a.out
mv ./a.out /mnt/bin/awk
make distclean

cd -
