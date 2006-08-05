cmd_arch/i386/boot/setup.o := gcc -Wp,-MD,arch/i386/boot/.setup.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -D__ASSEMBLY__ -Iinclude/asm-i386/mach-default -traditional -DSVGA_MODE=NORMAL_VGA  -D__BIG_KERNEL__   -c -o arch/i386/boot/setup.o arch/i386/boot/setup.S

deps_arch/i386/boot/setup.o := \
  arch/i386/boot/setup.S \
    $(wildcard include/config/x86/voyager.h) \
    $(wildcard include/config/x86/speedstep/smi.h) \
    $(wildcard include/config/x86/speedstep/smi/module.h) \
    $(wildcard include/config/apm.h) \
    $(wildcard include/config/apm/module.h) \
    $(wildcard include/config/x86/elan.h) \
  include/linux/config.h \
    $(wildcard include/config/h.h) \
  include/asm/segment.h \
  include/linux/version.h \
  include/linux/compile.h \
  include/asm/boot.h \
  include/asm/e820.h \
  include/asm/page.h \
    $(wildcard include/config/x86/use/3dnow.h) \
    $(wildcard include/config/x86/pae.h) \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/highmem4g.h) \
    $(wildcard include/config/highmem64g.h) \
    $(wildcard include/config/discontigmem.h) \
  arch/i386/boot/edd.S \
    $(wildcard include/config/edd.h) \
    $(wildcard include/config/edd/module.h) \
  include/linux/edd.h \
  arch/i386/boot/video.S \
    $(wildcard include/config/video/.h) \
    $(wildcard include/config/video/svga.h) \
    $(wildcard include/config/video/vesa.h) \
    $(wildcard include/config/video/compact.h) \
    $(wildcard include/config/video/retain.h) \
    $(wildcard include/config/video/local.h) \
    $(wildcard include/config/video/400/hack.h) \
    $(wildcard include/config/video/gfx/hack.h) \
    $(wildcard include/config/video/select.h) \

arch/i386/boot/setup.o: $(deps_arch/i386/boot/setup.o)

$(deps_arch/i386/boot/setup.o):
