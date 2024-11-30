#!/bin/sh -e

cd /src/packages/libz*/

./configure --prefix=/ --disable-shared --enable-static
make -j2
make install
make distclean

cd -
