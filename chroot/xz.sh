#!/bin/csh

cd /src/sources/xz/

env LD="echo" ./configure --prefix=/ --disable-doc --disable-microlzma \
        --disable-lzip-decoder --enable-small --enable-threads=posix \
        --disable-lzmadec --disable-lzmainfo --disable-lzma-links \
        --disable-scripts --enable-sandbox=no --enable-static \
        --disable-nls --disable-rpath --without-gnu-ld --disable-shared \
        --without-pic

make LDFLAGS="-s -static -g0 -all-static" -j$(nproc)
make install
make distclean

cd -
