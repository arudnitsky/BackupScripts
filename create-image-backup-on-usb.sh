#!/bin/bash
# This needs to run as root
echo Need to actually test this before letting it fly
exit
# [ ! -d "/dev/usbstorage" ] && mkdir "/dev/usbstorage"
pushd .
umount /dev/sda1
mount /dev/sda1 /dev/usb
lsblk
dd if=/dev/mmcblk0 of=/dev/usb/pi2image.img bs=1M
cd /dev/usb
# might want to install pishrink.sh prophylactically
pishrink.sh -z pi2image.img 
popd
umount /dev/sda1

