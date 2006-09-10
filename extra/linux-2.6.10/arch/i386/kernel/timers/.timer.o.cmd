cmd_arch/i386/kernel/timers/timer.o := gcc -Wp,-MD,arch/i386/kernel/timers/.timer.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2     -fomit-frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2 -fno-unit-at-a-time -march=pentium-mmx -Iinclude/asm-i386/mach-default -Wdeclaration-after-statement    -DKBUILD_BASENAME=timer -DKBUILD_MODNAME=timer -c -o arch/i386/kernel/timers/timer.o arch/i386/kernel/timers/timer.c

deps_arch/i386/kernel/timers/timer.o := \
  arch/i386/kernel/timers/timer.c \
    $(wildcard include/config/hpet/timer.h) \
    $(wildcard include/config/x86/cyclone/timer.h) \
    $(wildcard include/config/x86/pm/timer.h) \
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  include/linux/config.h \
    $(wildcard include/config/h.h) \
  include/linux/compiler.h \
  include/linux/compiler-gcc+.h \
  include/linux/compiler-gcc.h \
  include/linux/kernel.h \
    $(wildcard include/config/debug/spinlock/sleep.h) \
  /usr/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stdarg.h \
  include/linux/linkage.h \
  include/asm/linkage.h \
    $(wildcard include/config/regparm.h) \
    $(wildcard include/config/x86/alignment/16.h) \
  include/linux/stddef.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
  include/linux/posix_types.h \
  include/asm/posix_types.h \
  include/asm/types.h \
    $(wildcard include/config/highmem64g.h) \
    $(wildcard include/config/lbd.h) \
  include/linux/bitops.h \
  include/asm/bitops.h \
    $(wildcard include/config/smp.h) \
  include/asm/byteorder.h \
    $(wildcard include/config/x86/bswap.h) \
  include/linux/byteorder/little_endian.h \
  include/linux/byteorder/swab.h \
  include/linux/byteorder/generic.h \
  include/asm/bug.h \
  include/asm-generic/bug.h \
  include/linux/string.h \
  include/asm/string.h \
    $(wildcard include/config/x86/use/3dnow.h) \
  include/asm/timer.h \

arch/i386/kernel/timers/timer.o: $(deps_arch/i386/kernel/timers/timer.o)

$(deps_arch/i386/kernel/timers/timer.o):
