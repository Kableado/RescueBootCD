cmd_.tmp_kallsyms2.o := gcc -Wp,-MD,./..tmp_kallsyms2.o.d -D__ASSEMBLY__ -Iinclude/asm-i386/mach-default  -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude     -c -o .tmp_kallsyms2.o .tmp_kallsyms2.S

deps_.tmp_kallsyms2.o := \
  .tmp_kallsyms2.S \
  include/asm/types.h \
    $(wildcard include/config/highmem64g.h) \
    $(wildcard include/config/lbd.h) \

.tmp_kallsyms2.o: $(deps_.tmp_kallsyms2.o)

$(deps_.tmp_kallsyms2.o):
