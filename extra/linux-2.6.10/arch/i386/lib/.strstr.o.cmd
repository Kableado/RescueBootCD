cmd_arch/i386/lib/strstr.o := gcc -Wp,-MD,arch/i386/lib/.strstr.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2     -fomit-frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2 -fno-unit-at-a-time -march=pentium-mmx -Iinclude/asm-i386/mach-default -Wdeclaration-after-statement    -DKBUILD_BASENAME=strstr -DKBUILD_MODNAME=strstr -c -o arch/i386/lib/strstr.o arch/i386/lib/strstr.c

deps_arch/i386/lib/strstr.o := \
  arch/i386/lib/strstr.c \
  include/linux/string.h \
  include/linux/compiler.h \
  include/linux/compiler-gcc3.h \
  include/linux/compiler-gcc.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
  include/linux/config.h \
    $(wildcard include/config/h.h) \
  include/linux/posix_types.h \
  include/linux/stddef.h \
  include/asm/posix_types.h \
  include/asm/types.h \
    $(wildcard include/config/highmem64g.h) \
    $(wildcard include/config/lbd.h) \
  include/asm/string.h \
    $(wildcard include/config/x86/use/3dnow.h) \

arch/i386/lib/strstr.o: $(deps_arch/i386/lib/strstr.o)

$(deps_arch/i386/lib/strstr.o):
