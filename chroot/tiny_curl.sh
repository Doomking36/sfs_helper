#!/bin/csh

env CC="/src/gcc-toolchain/bin/gcc -Os -pipe -march=native -w -s -static -g0" \
    AR="/src/gcc-toolchain/bin/ar" RANLIB="/src/gcc-toolchain/bin/ranlib" \
    LDFLAGS="-s -static -g0 -L/lib -I/include" LD="echo" LIBS="-lbearssl -L/lib -I/include" \
    ./configure --prefix=/ --bindir=/bin --sbindir=/bin \
    --enable-unix-sockets --enable-symbol-hiding --disable-ipv6 \
    --disable-ldap --disable-ares --with-bearssl=/ \
    --without-pic --without-librtmp \
    --without-icu --without-libpsl --without-libidn \
    --without-libidn2 --without-brotli --without-zstd \
    --enable-static --without-shared --without-zsh-functions-dir \
    --without-fish-functions-dir --without-gnu-ld --disable-manual \
    --enable-pthreads --disable-ntlm --disable-mqtt --disable-libgcc \
    --disable-sspi --disable-ntlm-wb --disable-doh --disable-mime \
    --disable-netrc --disable-progress-meter --disable-dnsshuffle \
    --disable-alt-svc --without-nss --without-mesalink --without-hyper \
    --without-ldap --without-gssapi --without-libgsasl \
    --without-libssh2 --without-libssh --without-winidn \
    --without-quiche --disable-ech \
    --disable-curldebug --disable-debug --disable-ldaps --disable-rtsp \
    --disable-telnet --disable-tftp --disable-smb \
    --disable-cookies --without-schannel \
    --without-secure-transport

make LDFLAGS="-s -static -all-static -g0" -j($nproc)
make LDFLAGS="-s -static -all-static -g0" -j($nproc) -i #if an error related with the docs appears you can just ignore it with -i
make install -j($nproc)
make clean -j($nproc)
make distclean -j($nproc)
