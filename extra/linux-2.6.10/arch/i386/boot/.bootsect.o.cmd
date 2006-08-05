cmd_arch/i386/boot/bootsect.o := gcc -Wp,-MD,arch/i386/boot/.bootsect.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -D__ASSEMBLY__ -Iinclude/asm-i386/mach-default -traditional -DSVGA_MODE=NORMAL_VGA  -D__BIG_KERNEL__   -c -o arch/i386/boot/bootsect.o arch/i386/boot/bootsect.S

deps_arch/i386/boot/bootsect.o := \
  arch/i386/boot/bootsect.S \
  include/asm/boot.h \

arch/i386/boot/bootsect.o: $(deps_arch/i386/boot/bootsect.o)

$(deps_arch/i386/boot/bootsect.o):
