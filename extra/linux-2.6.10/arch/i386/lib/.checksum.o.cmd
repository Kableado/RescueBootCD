cmd_arch/i386/lib/checksum.o := gcc -Wp,-MD,arch/i386/lib/.checksum.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -D__ASSEMBLY__ -Iinclude/asm-i386/mach-default    -c -o arch/i386/lib/checksum.o arch/i386/lib/checksum.S

deps_arch/i386/lib/checksum.o := \
  arch/i386/lib/checksum.S \
    $(wildcard include/config/x86/use/ppro/checksum.h) \
  include/linux/config.h \
    $(wildcard include/config/h.h) \
  include/asm/errno.h \
  include/asm-generic/errno.h \
  include/asm-generic/errno-base.h \

arch/i386/lib/checksum.o: $(deps_arch/i386/lib/checksum.o)

$(deps_arch/i386/lib/checksum.o):
