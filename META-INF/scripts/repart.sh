#!/sbin/sh

# A226B Super Partition Resize Script
# Author: smiley9000 & Neel0210 (modified by H3CKER)

# Find the partition number for "super"
SUPER_NUM=$(/system/bin/sgdisk --print /dev/block/mmcblk0 | grep -i "super" | awk '{print $1}')

# Safety check
if [ -z "$SUPER_NUM" ]; then
    echo "Error: Could not find super partition!" >&2
    exit 1
fi

# Resize the super partition to 11200MiB (adjust as needed)
# This keeps the same start sector and only adjusts the end
/system/bin/sgdisk --resize=$SUPER_NUM:+11200Mib /dev/block/mmcblk0

# Print new table for verification
/system/bin/sgdisk --print /dev/block/mmcblk0

exit 0
