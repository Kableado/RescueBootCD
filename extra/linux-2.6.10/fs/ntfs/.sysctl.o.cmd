cmd_fs/ntfs/sysctl.o := gcc -Wp,-MD,fs/ntfs/.sysctl.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2     -fomit-frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2 -fno-unit-at-a-time -march=pentium-mmx -Iinclude/asm-i386/mach-default -Wdeclaration-after-statement -DNTFS_VERSION=\"2.1.22\"   -DKBUILD_BASENAME=sysctl -DKBUILD_MODNAME=ntfs -c -o fs/ntfs/sysctl.o fs/ntfs/sysctl.c

deps_fs/ntfs/sysctl.o := \
  fs/ntfs/sysctl.c \
    $(wildcard include/config/sysctl.h) \
    $(wildcard include/config/proc/fs.h) \

fs/ntfs/sysctl.o: $(deps_fs/ntfs/sysctl.o)

$(deps_fs/ntfs/sysctl.o):
