#!/bin/bash
print_help(){
  echo "Usage: ./copy.sh <petalinux output dir> <sd mountpoint parent dir>"
  exit 1
}
if [ -z $1 ]; then
  print_help
fi
if [ -z $2 ]; then
  print_help
fi

DIR=$1
SD=$2
set -x
sudo cp -r $DIR/image.ub $SD/BOOT
sudo cp -r $DIR/BOOT.BIN $SD/BOOT
sudo cp -r $DIR/rootfs.cpio.gz $SD/rootfs
set +x
