cmd_arch/i386/kernel/vsyscall-int80.so := gcc -nostdlib -shared -s -Wl,-soname=linux-gate.so.1 -Wl,-T,arch/i386/kernel/vsyscall.lds arch/i386/kernel/vsyscall-int80.o -o arch/i386/kernel/vsyscall-int80.so