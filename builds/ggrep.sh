#!/bin/sh

cd /mnt/src/sources/grep/

env CC="/mnt/bin/tcc -s -static -g0" \
    LDFLAGS="-s -static -g0" \
    AR="/mnt/bin/tcc -ar" \
    RANLIB="echo" ./configure --prefix=/ --disable-nls \
    --disable-rpath --enable-threads=posix --without-gnu-ld

make -j$(nproc)
make DESTDIR="../GGREP/" install

mv GGREP/bin/grep /mnt/bin/ggrep
mv GGREP/share/man/man1/grep.1 /mnt/share/man/man1/ggrep.1
rm -r ./GGREP/

make distclean

cd -
