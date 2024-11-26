#!/bin/csh

./configure --prefix=/ --disable-shared --enable-static
make -j$(nproc)
make install
make distclean
