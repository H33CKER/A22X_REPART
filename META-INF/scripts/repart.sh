#!/sbin/sh

# KKRT A226B Repartition Script
# Author: smiley9000 & Neel0210

# Delete unwanted partitions
/system/bin/sgdisk --delete 58 /dev/block/mmcblk0
/system/bin/sgdisk --delete 49 /dev/block/mmcblk0
/system/bin/sgdisk --delete 48 /dev/block/mmcblk0
/system/bin/sgdisk --delete 50 /dev/block/mmcblk0
/system/bin/sgdisk --delete 51 /dev/block/mmcblk0
/system/bin/sgdisk --delete 52 /dev/block/mmcblk0
/system/bin/sgdisk --delete 53 /dev/block/mmcblk0
/system/bin/sgdisk --delete 54 /dev/block/mmcblk0

# Create new partitions
/system/bin/sgdisk --new=0:0:+706Mib --typecode=0:11 --change-name=0:prism /dev/block/mmcblk0
/system/bin/sgdisk --new=0:0:+25Mib --typecode=0:11 --change-name=0:optics /dev/block/mmcblk0
/system/bin/sgdisk --new=0:0:+200Mib --typecode=0:11 --change-name=0:cache /dev/block/mmcblk0
/system/bin/sgdisk --new=0:0:+50Mib --typecode=0:11 --change-name=0:omr /dev/block/mmcblk0
/system/bin/sgdisk --new=0:0:+50Mib --typecode=0:11 --change-name=0:spu /dev/block/mmcblk0
/system/bin/sgdisk --new=0:0:+11200Mib --typecode=0:11 --change-name=0:super /dev/block/mmcblk0
/system/bin/sgdisk --new=0:0: --typecode=0:11 --change-name=0:userdata /dev/block/mmcblk0

exit 0
