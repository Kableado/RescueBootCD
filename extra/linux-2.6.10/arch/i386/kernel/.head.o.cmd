cmd_arch/i386/kernel/head.o := gcc -Wp,-MD,arch/i386/kernel/.head.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -D__ASSEMBLY__ -Iinclude/asm-i386/mach-default -traditional   -c -o arch/i386/kernel/head.o arch/i386/kernel/head.S

deps_arch/i386/kernel/head.o := \
  arch/i386/kernel/head.S \
    $(wildcard include/config/smp.h) \
  include/linux/config.h \
    $(wildcard include/config/h.h) \
  include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
  include/linux/linkage.h \
  include/asm/linkage.h \
    $(wildcard include/config/regparm.h) \
    $(wildcard include/config/x86/alignment/16.h) \
  include/asm/segment.h \
  include/asm/page.h \
    $(wildcard include/config/x86/use/3dnow.h) \
    $(wildcard include/config/x86/pae.h) \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/highmem4g.h) \
    $(wildcard include/config/highmem64g.h) \
    $(wildcard include/config/discontigmem.h) \
  include/asm/pgtable.h \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/highpte.h) \
  include/asm-generic/pgtable.h \
  include/asm/desc.h \
  include/asm/ldt.h \
  include/asm/cache.h \
    $(wildcard include/config/x86/l1/cache/shift.h) \
  include/asm/thread_info.h \
    $(wildcard include/config/4kstacks.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  include/linux/compiler.h \
  include/asm/asm_offsets.h \
  include/asm/setup.h \

arch/i386/kernel/head.o: $(deps_arch/i386/kernel/head.o)

$(deps_arch/i386/kernel/head.o):
