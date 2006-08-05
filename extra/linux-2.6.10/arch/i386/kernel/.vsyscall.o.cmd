cmd_arch/i386/kernel/vsyscall.o := gcc -Wp,-MD,arch/i386/kernel/.vsyscall.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -D__ASSEMBLY__ -Iinclude/asm-i386/mach-default -traditional   -c -o arch/i386/kernel/vsyscall.o arch/i386/kernel/vsyscall.S

deps_arch/i386/kernel/vsyscall.o := \
  arch/i386/kernel/vsyscall.S \
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  include/linux/config.h \
    $(wildcard include/config/h.h) \
  include/linux/compiler.h \

arch/i386/kernel/vsyscall.o: $(deps_arch/i386/kernel/vsyscall.o)

$(deps_arch/i386/kernel/vsyscall.o):
