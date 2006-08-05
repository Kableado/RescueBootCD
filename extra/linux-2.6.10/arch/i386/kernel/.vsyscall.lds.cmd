cmd_arch/i386/kernel/vsyscall.lds := gcc -E -Wp,-MD,arch/i386/kernel/.vsyscall.lds.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude   -P -C -Ui386 -D__ASSEMBLY__ -o arch/i386/kernel/vsyscall.lds arch/i386/kernel/vsyscall.lds.S

deps_arch/i386/kernel/vsyscall.lds := \
  arch/i386/kernel/vsyscall.lds.S \
  include/asm/asm_offsets.h \

arch/i386/kernel/vsyscall.lds: $(deps_arch/i386/kernel/vsyscall.lds)

$(deps_arch/i386/kernel/vsyscall.lds):
