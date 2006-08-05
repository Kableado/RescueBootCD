cmd_lib/errno.o := gcc -Wp,-MD,lib/.errno.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2     -fomit-frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2 -fno-unit-at-a-time -march=pentium-mmx -Iinclude/asm-i386/mach-default -Wdeclaration-after-statement    -DKBUILD_BASENAME=errno -DKBUILD_MODNAME=errno -c -o lib/errno.o lib/errno.c

deps_lib/errno.o := \
  lib/errno.c \

lib/errno.o: $(deps_lib/errno.o)

$(deps_lib/errno.o):
