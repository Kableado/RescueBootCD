./build_initrd.sh

mv rootfs.gz CD/boot/rootfs.gz


rdev CD/boot/bzimage /dev/ram0

mkisofs -o /mnt/sda1/bootcd.iso -b boot/isolinux/isolinux.bin -c boot/isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table CD
