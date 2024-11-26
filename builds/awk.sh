#!/bin/sh

cd /mnt/src/sources/awk*/

env HOSTCC="/mnt/bin/tcc -s -static -g0" \
    AR="/mnt/bin/tcc -ar" RANLIB="echo" YACC="/mnt/bin/yacc -d -b awkgram" \
    
make -e -j$(nproc)
mv ./a.out /mnt/bin/awk
make distclean

cd -
