#!/bin/csh

env LD="echo" CC="/src/gcc-toolchain/bin/gcc -Os -pipe -march=native -s -static -g0" \
    ./configure --prefix=/ --libexecdir=/bin --bindir=/bin --sbindir=/bin \
    --disable-systemd-service --disable-dbus-policy --disable-dbus --localstatedir=/var \
    --disable-manual-pages --disable-pie --disable-shared --enable-static

sed 's/$(LDFLAGS) -o/-all-static $(LDFLAGS) -o/' Makefile > _
mv -f _ Makefile
make -j$(nproc)
make install
make distclean
