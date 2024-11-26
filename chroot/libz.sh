#!/bin/csh

cd /src/sources/libz/

./configure --prefix=/ --disable-shared --enable-static
make -j$(nproc)
make install
make distclean

cd -
