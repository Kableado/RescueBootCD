cmd_drivers/input/built-in.o :=  ld -m elf_i386  -r -o drivers/input/built-in.o drivers/input/input.o drivers/input/mousedev.o drivers/input/keyboard/built-in.o drivers/input/mouse/built-in.o
