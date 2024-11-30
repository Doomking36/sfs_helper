#!/bin/sh -e

cd /mnt/src/sources/vim/

env CC="/mnt/bin/tcc -s -static -g0" \
    CFLAGS="-Os -march=native -pipe -s -static -g0" \
    LDFLAGS="-s -static -g0" \
    AR="/mnt/bin/tcc -ar" \
    RANLIB="echo" ./configure --prefix="/" --enable-cscope --enable-multibyte --with-ex-name=vim-ex --with-view-name=vim-view --disable-perlinterp \
    --disable-pythoninterp --disable-rubyinterp --disable-netbeans --disable-gpm --disable-xim --disable-gui --disable-nls --without-x

make -j$(nproc)
make DESTDIR="/mnt" install
make distclean

cd -
