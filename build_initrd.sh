#!/bin/sh

# crear la imagen del rootfs
dd if=/dev/zero of=file.rootfs bs=1k count=4096
mke2fs -F -m 0 -N 2000 file.rootfs


#################################
# montar y copiar los ficheros
#################################
mount -t ext2 -o loop file.rootfs tmp.mountp
cp -dRvp rootfs/* tmp.mountp/
umount tmp.mountp

# comprimir
dd if=file.rootfs bs=1k | gzip -v9 > rootfs.gz
# borrar fichero temporal
rm file.rootfs
