cmd_arch/i386/boot/compressed/head.o := gcc -Wp,-MD,arch/i386/boot/compressed/.head.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -D__ASSEMBLY__ -Iinclude/asm-i386/mach-default -traditional   -c -o arch/i386/boot/compressed/head.o arch/i386/boot/compressed/head.S

deps_arch/i386/boot/compressed/head.o := \
  arch/i386/boot/compressed/head.S \
  include/linux/linkage.h \
  include/linux/config.h \
    $(wildcard include/config/h.h) \
  include/asm/linkage.h \
    $(wildcard include/config/regparm.h) \
    $(wildcard include/config/x86/alignment/16.h) \
  include/asm/segment.h \

arch/i386/boot/compressed/head.o: $(deps_arch/i386/boot/compressed/head.o)

$(deps_arch/i386/boot/compressed/head.o):
