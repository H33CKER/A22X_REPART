#!/sbin/sh

# A226B Super Partition + Userdata Resize Script
# Author: smiley9000 & Neel0210 (Modified by H3CKER)

# Find the current super and userdata partition numbers
SUPER_NUM=$(/system/bin/sgdisk --print /dev/block/mmcblk0 | grep -i "super" | awk '{print $1}')
USERDATA_NUM=$(/system/bin/sgdisk --print /dev/block/mmcblk0 | grep -i "userdata" | awk '{print $1}')

if [ -z "$SUPER_NUM" ] || [ -z "$USERDATA_NUM" ]; then
    echo "Error: Could not find super or userdata partition!"
    exit 1
fi

# Delete and recreate super (set to 11200 MiB)
/system/bin/sgdisk --delete=$SUPER_NUM /dev/block/mmcblk0
/system/bin/sgdisk --new=$SUPER_NUM:0:+11200MiB --typecode=$SUPER_NUM:11 --change-name=$SUPER_NUM:super /dev/block/mmcblk0

# Delete and recreate userdata to take all remaining space
/system/bin/sgdisk --delete=$USERDATA_NUM /dev/block/mmcblk0
/system/bin/sgdisk --new=$USERDATA_NUM:0:0 --typecode=$USERDATA_NUM:11 --change-name=$USERDATA_NUM:userdata /dev/block/mmcblk0

# Print result for verification
/system/bin/sgdisk --print /dev/block/mmcblk0

exit 0
