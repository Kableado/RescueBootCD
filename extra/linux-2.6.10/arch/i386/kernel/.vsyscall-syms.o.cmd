cmd_arch/i386/kernel/vsyscall-syms.o := gcc -nostdlib -r -Wl,-T,arch/i386/kernel/vsyscall.lds arch/i386/kernel/vsyscall-sysenter.o -o arch/i386/kernel/vsyscall-syms.o
