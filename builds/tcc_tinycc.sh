#!/bin/sh

env CC="/mnt/bin/tcc -s -static -g0 -L/mnt/lib/ -I/mnt/include" \
    LDFLAGS="-s -static -g0" \
    AR="/mnt/bin/tcc -ar"  \
    RANLIB="echo" \
./configure --config-musl --disable-rpath --enable-static \
--prefix=/ --sysincludepaths="/mnt/lib/tcc/include:/mnt/include:/lib/tcc/include:/include" \
--libpaths="/mnt/lib:/mnt/lib/tcc:/lib:/lib/tcc" --crtprefix="/mnt/lib:/lib" \
--cross-prefix="/mnt" --cc="/bin/tcc -s -static -g0" \
--ar="/bin/tcc -ar"

make -j($nproc)
make DESTDIR="/mnt" install
make distclean
