cmd_arch/i386/kernel/entry.o := gcc -Wp,-MD,arch/i386/kernel/.entry.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -D__ASSEMBLY__ -Iinclude/asm-i386/mach-default -traditional   -c -o arch/i386/kernel/entry.o arch/i386/kernel/entry.S

deps_arch/i386/kernel/entry.o := \
  arch/i386/kernel/entry.S \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/x86/mce.h) \
  include/linux/config.h \
    $(wildcard include/config/h.h) \
  include/linux/linkage.h \
  include/asm/linkage.h \
    $(wildcard include/config/regparm.h) \
    $(wildcard include/config/x86/alignment/16.h) \
  include/asm/thread_info.h \
    $(wildcard include/config/4kstacks.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  include/linux/compiler.h \
  include/asm/page.h \
    $(wildcard include/config/x86/use/3dnow.h) \
    $(wildcard include/config/x86/pae.h) \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/highmem4g.h) \
    $(wildcard include/config/highmem64g.h) \
    $(wildcard include/config/discontigmem.h) \
  include/asm/asm_offsets.h \
  include/asm/errno.h \
  include/asm-generic/errno.h \
  include/asm-generic/errno-base.h \
  include/asm/segment.h \
  include/asm/smp.h \
    $(wildcard include/config/x86/local/apic.h) \
    $(wildcard include/config/x86/io/apic.h) \
    $(wildcard include/config/smp.h) \
  include/asm-i386/mach-default/irq_vectors.h \
  include/asm-i386/mach-default/irq_vectors_limits.h \
    $(wildcard include/config/pci/msi.h) \
  include/asm-i386/mach-default/entry_arch.h \
    $(wildcard include/config/x86/smp.h) \
    $(wildcard include/config/x86/mce/p4thermal.h) \

arch/i386/kernel/entry.o: $(deps_arch/i386/kernel/entry.o)

$(deps_arch/i386/kernel/entry.o):
