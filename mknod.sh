mknod -m=0600 /mnt/dev/console c 5 1 && mknod -m=0666 /mnt/dev/null c 1 3 && mknod -m=0666 /mnt/dev/random c 1 8 && mknod -m=0666 /mnt/dev/urandom c 1 9
