cmd_drivers/media/built-in.o :=  ld -m elf_i386  -r -o drivers/media/built-in.o drivers/media/video/built-in.o drivers/media/radio/built-in.o drivers/media/dvb/built-in.o drivers/media/common/built-in.o