#!/bin/csh

cd /src/packages/tiny-curl*/

env CC="tcc -Os -pipe -march=native -w -s -static -g0" \
    AR="tcc -ar" RANLIB="tcc-ranlib" \
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

make LDFLAGS="-s -static -all-static -g0" -j2
make install -j2
make clean -j2
make distclean -j2

cd -
