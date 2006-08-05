cmd_arch/i386/kernel/vsyscall-sysenter.o := gcc -Wp,-MD,arch/i386/kernel/.vsyscall-sysenter.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -D__ASSEMBLY__ -Iinclude/asm-i386/mach-default -traditional   -c -o arch/i386/kernel/vsyscall-sysenter.o arch/i386/kernel/vsyscall-sysenter.S

deps_arch/i386/kernel/vsyscall-sysenter.o := \
  arch/i386/kernel/vsyscall-sysenter.S \
  arch/i386/kernel/vsyscall-sigreturn.S \
  include/asm/unistd.h \
  include/asm/asm_offsets.h \

arch/i386/kernel/vsyscall-sysenter.o: $(deps_arch/i386/kernel/vsyscall-sysenter.o)

$(deps_arch/i386/kernel/vsyscall-sysenter.o):
