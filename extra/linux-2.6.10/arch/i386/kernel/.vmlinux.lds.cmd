cmd_arch/i386/kernel/vmlinux.lds := gcc -E -Wp,-MD,arch/i386/kernel/.vmlinux.lds.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude   -P -C -Ui386 -D__ASSEMBLY__ -o arch/i386/kernel/vmlinux.lds arch/i386/kernel/vmlinux.lds.S

deps_arch/i386/kernel/vmlinux.lds := \
  arch/i386/kernel/vmlinux.lds.S \
  include/asm-generic/vmlinux.lds.h \
  include/asm/thread_info.h \
    $(wildcard include/config/4kstacks.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  include/linux/config.h \
    $(wildcard include/config/h.h) \
  include/linux/compiler.h \
  include/asm/page.h \
    $(wildcard include/config/x86/use/3dnow.h) \
    $(wildcard include/config/x86/pae.h) \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/highmem4g.h) \
    $(wildcard include/config/highmem64g.h) \
    $(wildcard include/config/discontigmem.h) \
  include/asm/asm_offsets.h \

arch/i386/kernel/vmlinux.lds: $(deps_arch/i386/kernel/vmlinux.lds)

$(deps_arch/i386/kernel/vmlinux.lds):
