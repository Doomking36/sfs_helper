#!/bin/csh

cd /src/packages/less*/

env LIBS="-lcurses" LD="echo" CC="tcc -s -static -g0" \
    ./configure --prefix=/ --with-no-float --with-editor=vim \
    --with-regex=posix

make -j$(nproc)
make install
make distclean

cd -
