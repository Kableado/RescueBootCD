cmd_scripts/lxdialog/lxdialog.o := gcc -Wp,-MD,scripts/lxdialog/.lxdialog.o.d -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer   -DLOCALE  -DCURSES_LOC="<ncurses.h>"    -c -o scripts/lxdialog/lxdialog.o scripts/lxdialog/lxdialog.c

deps_scripts/lxdialog/lxdialog.o := \
  scripts/lxdialog/lxdialog.c \
  scripts/lxdialog/dialog.h \
  /usr/include/sys/types.h \
  /usr/include/features.h \
  /usr/include/sys/cdefs.h \
  /usr/include/gnu/stubs.h \
  /usr/include/bits/types.h \
  /usr/include/bits/wordsize.h \
  /usr/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stddef.h \
  /usr/include/bits/typesizes.h \
  /usr/include/time.h \
  /usr/include/endian.h \
  /usr/include/bits/endian.h \
  /usr/include/sys/select.h \
  /usr/include/bits/select.h \
  /usr/include/bits/sigset.h \
  /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h \
  /usr/include/fcntl.h \
  /usr/include/bits/fcntl.h \
  /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h \
  /usr/include/getopt.h \
  /usr/include/ctype.h \
  /usr/include/stdlib.h \
  /usr/include/alloca.h \
  /usr/include/string.h \
  /usr/include/bits/string.h \
  /usr/include/bits/string2.h \
  /usr/include/ncurses.h \
  /usr/include/ncurses_dll.h \
  /usr/include/stdio.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/include/bits/wchar.h \
  /usr/include/gconv.h \
  /usr/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stdarg.h \
  /usr/include/bits/stdio_lim.h \
  /usr/include/bits/sys_errlist.h \
  /usr/include/bits/stdio.h \
  /usr/include/unctrl.h \
  /usr/include/curses.h \
  /usr/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stdbool.h \
  /usr/include/locale.h \
  /usr/include/bits/locale.h \

scripts/lxdialog/lxdialog.o: $(deps_scripts/lxdialog/lxdialog.o)

$(deps_scripts/lxdialog/lxdialog.o):
