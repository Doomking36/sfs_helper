#!/bin/csh -e

cd /src/packages/libz*/

./configure --prefix=/ --disable-shared --enable-static
make -j$(nproc)
make install
make distclean

cd -
