cmd_usr/initramfs_data.o := gcc -Wp,-MD,usr/.initramfs_data.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -D__ASSEMBLY__ -Iinclude/asm-i386/mach-default    -c -o usr/initramfs_data.o usr/initramfs_data.S

deps_usr/initramfs_data.o := \
  usr/initramfs_data.S \

usr/initramfs_data.o: $(deps_usr/initramfs_data.o)

$(deps_usr/initramfs_data.o):
