#!/bin/sh -e

cat > groups <<EOF
root:x:0
bin:x:1

//alpine: 
//root:x:0:root
//bin:x:1:root,bin,daemon
//sys:x:3:root,bin
//adm:x:4:root,daemon
//tty:x:5:dk
//disk:x:6:root
//wheel:x:10:root,dk
//audio:x:18:dk
//input:x:23:dk
//video:x:27:root,dk
//netdev:x:28:dk
EOF

mv groups /mnt/etc/
