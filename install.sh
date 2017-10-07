#!/bin/sh
echo Preparing Docker ISO

# Variables
DIR=`pwd`

# Create necessaty temp directories
mkdir -p /tmp/iso_new
mkdir -p /tmp/iso_new/docker/
mkdir -p /cdrom

# Mount the ISO
mount -o loop iso/ubuntu-14.04.4-server-amd64.iso /cdrom

# Copy the contents from the iso to temp directory
rsync -av /cdrom/ /tmp/iso_new/

# Copy the custom preseed to the temp directory
cp custom_preseed/custom.seed /tmp/iso_new/preseed/

# Overwrite the txt.cfg in temp directory
cp -f custom_isolinux/txt.cfg /tmp/iso_new/isolinux/

# Copy the docker supporting files to temp directory
cp -rf docker/* /tmp/iso_new/docker/

# Overwrite the grub.conf
cp -f grub/grub.cfg /tmp/iso_new/boot/grub/

cd /tmp/iso_new

# Create the image
mkisofs -o $DIR/ubuntu-docker-app.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -V "Ubuntu Docker Apps ISO" .

cd -

# Clean up
rm -rf /tmp/iso_new
umount /cdrom
