#!/bin/sh -e

cat > passwd <<EOF
root:x:0:0:root:/root:/bin/csh
bin:x:1:1:bin:/dev/null:/bin/false
//alpine: 
//bin:x:1:1:bin:/bin:/sbin/nologin
//daemon:x:2:2:daemon:/sbin:/sbin/nologin
//shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
EOF

mv passwd /mnt/etc/
