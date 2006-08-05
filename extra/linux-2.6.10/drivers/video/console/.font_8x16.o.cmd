cmd_drivers/video/console/font_8x16.o := gcc -Wp,-MD,drivers/video/console/.font_8x16.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2     -fomit-frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2 -fno-unit-at-a-time -march=pentium-mmx -Iinclude/asm-i386/mach-default -Wdeclaration-after-statement    -DKBUILD_BASENAME=font_8x16 -DKBUILD_MODNAME=font -c -o drivers/video/console/font_8x16.o drivers/video/console/font_8x16.c

deps_drivers/video/console/font_8x16.o := \
  drivers/video/console/font_8x16.c \
  include/linux/font.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
  include/linux/config.h \
    $(wildcard include/config/h.h) \
  include/linux/posix_types.h \
  include/linux/stddef.h \
  include/linux/compiler.h \
  include/linux/compiler-gcc3.h \
  include/linux/compiler-gcc.h \
  include/asm/posix_types.h \
  include/asm/types.h \
    $(wildcard include/config/highmem64g.h) \
    $(wildcard include/config/lbd.h) \

drivers/video/console/font_8x16.o: $(deps_drivers/video/console/font_8x16.o)

$(deps_drivers/video/console/font_8x16.o):
