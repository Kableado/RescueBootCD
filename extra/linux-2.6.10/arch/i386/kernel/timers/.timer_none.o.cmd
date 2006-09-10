cmd_arch/i386/kernel/timers/timer_none.o := gcc -Wp,-MD,arch/i386/kernel/timers/.timer_none.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2     -fomit-frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2 -fno-unit-at-a-time -march=pentium-mmx -Iinclude/asm-i386/mach-default -Wdeclaration-after-statement    -DKBUILD_BASENAME=timer_none -DKBUILD_MODNAME=timer_none -c -o arch/i386/kernel/timers/timer_none.o arch/i386/kernel/timers/timer_none.c

deps_arch/i386/kernel/timers/timer_none.o := \
  arch/i386/kernel/timers/timer_none.c \
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  include/linux/config.h \
    $(wildcard include/config/h.h) \
  include/linux/compiler.h \
  include/linux/compiler-gcc+.h \
  include/linux/compiler-gcc.h \
  include/asm/timer.h \
    $(wildcard include/config/x86/cyclone/timer.h) \
    $(wildcard include/config/hpet/timer.h) \
    $(wildcard include/config/x86/pm/timer.h) \

arch/i386/kernel/timers/timer_none.o: $(deps_arch/i386/kernel/timers/timer_none.o)

$(deps_arch/i386/kernel/timers/timer_none.o):
