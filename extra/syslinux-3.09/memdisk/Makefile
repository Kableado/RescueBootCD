#ident "$Id: Makefile,v 1.29 2004/12/29 01:58:02 hpa Exp $"
## -----------------------------------------------------------------------
##   
##   Copyright 2001-2004 H. Peter Anvin - All Rights Reserved
##
##   This program is free software; you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation, Inc., 53 Temple Place Ste 330,
##   Boston MA 02111-1307, USA; either version 2 of the License, or
##   (at your option) any later version; incorporated herein by reference.
##
## -----------------------------------------------------------------------

VERSION := $(shell cat ../version)

gcc_ok   = $(shell if gcc $(1) -c -x c /dev/null -o /dev/null 2>/dev/null; \
	           then echo $(1); else echo $(2); fi)

M32     := $(call gcc_ok,-m32,)
ALIGN   := $(call gcc_ok,-falign-functions=0 -falign-jumps=0 -falign-loops=0,-malign-functions=0 -malign-jumps=0 -malign-loops=0)

CC       = gcc $(M32)
CFLAGS   = -g -W -Wall -Wno-sign-compare \
	   -Os -fomit-frame-pointer -march=i386 $(ALIGN) \
	   -DVERSION='"$(VERSION)"' -DDATE='"$(DATE)"'
LDFLAGS  = -g
INCLUDE  = -I../com32/include
LD	 = ld -m elf_i386
NASM     = nasm -O99
NFLAGS   = -dVERSION='"$(VERSION)"' -dDATE='"$(DATE)"'
NINCLUDE = 
OBJCOPY  = objcopy
PERL     = perl

# Important: init.o16 must be first!!
OBJS16   = init.o16 init32.o
OBJS32   = start32.o setup.o msetup.o e820func.o conio.o memcpy.o memset.o \
           unzip.o memdisk.o

CSRC     = setup.c msetup.c e820func.c conio.c unzip.c
SSRC     = 
NASMSRC  = memdisk.asm memdisk16.asm

all: memdisk e820test

# tidy, clean removes everything except the final binary
tidy:
	rm -f *.o *.s *.o16 *.s16 *.bin *.lst *.elf e820test

clean: tidy

# spotless also removes the product binary
spotless: clean
	rm -f memdisk .depend

%.o: %.asm
	$(NASM) $(NFLAGS) -f elf -l $*.lst -o $@ $<

%.o: %.s
	$(CC) -x assembler -c -o $@ $<

%.o16: %.s16
	$(CC) -x assembler -c -o $@ $<

%.o: %.c
	$(CC) $(INCLUDE) $(CFLAGS) -c -o $@ $<

%.s16: %.s
	echo '.code16gcc' | cat - $< > $@

%.s: %.S
	$(CC) -x c $(INCLUDE) $(CFLAGS) -traditional -E -o $@ $<

%.s16: %.S16
	$(CC) -x c $(INCLUDE) $(CFLAGS) -traditional -E -o $@ $<

%.s: %.c
	$(CC) $(INCLUDE) $(CFLAGS) -S -o $@ $<

%.i: %.c
	$(CC) $(INCLUDE) $(CFLAGS) -E -o $@ $<

# Cancel default rule
%.o: %.c

%.bin: %.asm
	$(NASM) -f bin $(NFLAGS) $(NINCLUDE) -o $@ -l $*.lst $<

memdisk16.elf: $(OBJS16)
	$(LD) -Ttext 0 -o $@ $^

memdisk32.elf: $(OBJS32)
	$(LD) -Ttext 0x100000 -o $@ $^

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

memdisk: memdisk16.bin memdisk32.bin postprocess.pl
	$(PERL) postprocess.pl $@ memdisk16.bin memdisk32.bin

e820test: e820func.o msetup.o e820test.o memdisk.o
	$(CC) $(LDFLAGS) -o $@ $^

memdisk.o: memdisk.bin
	$(LD) -r -b binary -o $@ $<

.depend:
	rm -f .depend
	for csrc in *.c ; do $(CC) $(INCLUDE) -MM $$csrc | sed -e 's/\.o/\.s/' >> .depend ; done
	for ssrc in $(SSRC) ; do $(CC) $(INCLUDE) -x c -traditional -MM $$ssrc | sed -e 's/\.S16\.o/\.o16/' >> .depend ; done
	for nsrc in $(NASMSRC) ; do $(NASM) -DDEPEND $(NINCLUDE) -o `echo $$nsrc | sed -e 's/\.asm/\.bin/'` -M $$nsrc >> .depend ; done

depend:
	rm -f .depend
	$(MAKE) .depend

# This file contains the version number, so add a dependency for it
setup.s: ../version

# Include dependencies file
include .depend
