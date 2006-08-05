cmd_.tmp_kallsyms1.o := gcc -Wp,-MD,./..tmp_kallsyms1.o.d -D__ASSEMBLY__ -Iinclude/asm-i386/mach-default  -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude     -c -o .tmp_kallsyms1.o .tmp_kallsyms1.S

deps_.tmp_kallsyms1.o := \
  .tmp_kallsyms1.S \
  include/asm/types.h \
    $(wildcard include/config/highmem64g.h) \
    $(wildcard include/config/lbd.h) \

.tmp_kallsyms1.o: $(deps_.tmp_kallsyms1.o)

$(deps_.tmp_kallsyms1.o):
