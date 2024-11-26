#!/bin/sh

cat > profile <<EOF
#!/bin/csh
#PATH

setenv PATH "/bin"

#FLAGS
#only gcc will be able to use CFLAGS, tcc will only ignore them.
setenv FLAGS "-Os -march=native -pipe -g0 -static -s"
setenv CFLAGS "$FLAGS"
setenv CXXFLAGS "$FLAGS"
setenv CPPFLAGS "$FLAGS"

setenv LDFLAGS "-s -static -g0"
setenv AR "tcc -ar"
setenv RANLIB "echo"

setenv CC "tcc"

#PROMPT

set prompt=" < %/ > -: "

#TERM

setenv TERM "linux"
EOF

mv profile /mnt/etc/
