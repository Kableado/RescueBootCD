cmd_arch/i386/kernel/cpu/umc.o := gcc -Wp,-MD,arch/i386/kernel/cpu/.umc.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2     -fomit-frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2 -fno-unit-at-a-time -march=pentium-mmx -Iinclude/asm-i386/mach-default -Wdeclaration-after-statement    -DKBUILD_BASENAME=umc -DKBUILD_MODNAME=umc -c -o arch/i386/kernel/cpu/umc.o arch/i386/kernel/cpu/umc.c

deps_arch/i386/kernel/cpu/umc.o := \
  arch/i386/kernel/cpu/umc.c \
  include/linux/kernel.h \
    $(wildcard include/config/debug/spinlock/sleep.h) \
  /usr/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stdarg.h \
  include/linux/linkage.h \
  include/linux/config.h \
    $(wildcard include/config/h.h) \
  include/asm/linkage.h \
    $(wildcard include/config/regparm.h) \
    $(wildcard include/config/x86/alignment/16.h) \
  include/linux/stddef.h \
  include/linux/compiler.h \
  include/linux/compiler-gcc+.h \
  include/linux/compiler-gcc.h \
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
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  include/asm/processor.h \
    $(wildcard include/config/mk8.h) \
    $(wildcard include/config/mk7.h) \
  include/asm/vm86.h \
  include/asm/math_emu.h \
  include/asm/sigcontext.h \
  include/asm/segment.h \
  include/asm/page.h \
    $(wildcard include/config/x86/use/3dnow.h) \
    $(wildcard include/config/x86/pae.h) \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/highmem4g.h) \
    $(wildcard include/config/discontigmem.h) \
  include/asm/cpufeature.h \
  include/asm/msr.h \
  include/asm/system.h \
    $(wildcard include/config/x86/cmpxchg.h) \
    $(wildcard include/config/x86/oostore.h) \
  include/linux/cache.h \
  include/asm/cache.h \
    $(wildcard include/config/x86/l1/cache/shift.h) \
  include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
  include/asm/percpu.h \
  include/asm-generic/percpu.h \
  arch/i386/kernel/cpu/cpu.h \

arch/i386/kernel/cpu/umc.o: $(deps_arch/i386/kernel/cpu/umc.o)

$(deps_arch/i386/kernel/cpu/umc.o):
