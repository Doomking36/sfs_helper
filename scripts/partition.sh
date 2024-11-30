#!/bin/sh -e

# Create GPT partition table and partitions
fdisk /dev/sda <<EOF
g
n
1

+512M
t
1
n
2


w
EOF

# Format partitions
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

# Mount partitions
mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

echo "Partitioning, formatting, and mounting completed successfully."
