cmd_scripts/kconfig/mconf.o := gcc -Wp,-MD,scripts/kconfig/.mconf.o.d -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer       -c -o scripts/kconfig/mconf.o scripts/kconfig/mconf.c

deps_scripts/kconfig/mconf.o := \
  scripts/kconfig/mconf.c \
    $(wildcard include/config/.h) \
    $(wildcard include/config/mode.h) \
  /usr/include/sys/ioctl.h \
  /usr/include/features.h \
  /usr/include/sys/cdefs.h \
  /usr/include/gnu/stubs.h \
  /usr/include/bits/ioctls.h \
  /usr/include/asm/ioctls.h \
  /usr/include/asm/ioctl.h \
  /usr/include/bits/ioctl-types.h \
  /usr/include/sys/ttydefaults.h \
  /usr/include/sys/wait.h \
  /usr/include/signal.h \
  /usr/include/bits/sigset.h \
  /usr/include/bits/types.h \
  /usr/include/bits/wordsize.h \
  /usr/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stddef.h \
  /usr/include/bits/typesizes.h \
  /usr/include/bits/signum.h \
  /usr/include/time.h \
  /usr/include/bits/siginfo.h \
  /usr/include/bits/sigaction.h \
  /usr/include/bits/sigcontext.h \
  /usr/include/asm/sigcontext.h \
  /usr/include/bits/sigstack.h \
  /usr/include/bits/pthreadtypes.h \
  /usr/include/bits/sigthread.h \
  /usr/include/sys/resource.h \
  /usr/include/bits/resource.h \
  /usr/include/bits/time.h \
  /usr/include/bits/waitflags.h \
  /usr/include/bits/waitstatus.h \
  /usr/include/endian.h \
  /usr/include/bits/endian.h \
  /usr/include/ctype.h \
  /usr/include/errno.h \
  /usr/include/bits/errno.h \
  /usr/include/linux/errno.h \
  /usr/include/asm/errno.h \
  /usr/include/fcntl.h \
  /usr/include/bits/fcntl.h \
  /usr/include/sys/types.h \
  /usr/include/sys/select.h \
  /usr/include/bits/select.h \
  /usr/include/sys/sysmacros.h \
  /usr/lib/gcc/i686-pc-linux-gnu/4.0.3/include/limits.h \
  /usr/lib/gcc/i686-pc-linux-gnu/4.0.3/include/syslimits.h \
  /usr/include/limits.h \
  /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h \
  /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h \
  /usr/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stdarg.h \
  /usr/include/stdlib.h \
  /usr/include/alloca.h \
  /usr/include/string.h \
  /usr/include/bits/string.h \
  /usr/include/bits/string2.h \
  /usr/include/termios.h \
  /usr/include/bits/termios.h \
  /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h \
  /usr/include/getopt.h \
  /usr/include/regex.h \
  scripts/kconfig/lkc.h \
  scripts/kconfig/expr.h \
  /usr/include/stdio.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/include/bits/wchar.h \
  /usr/include/gconv.h \
  /usr/include/bits/stdio_lim.h \
  /usr/include/bits/sys_errlist.h \
  /usr/include/bits/stdio.h \
  /usr/lib/gcc/i686-pc-linux-gnu/4.0.3/include/stdbool.h \
  scripts/kconfig/lkc_proto.h \

scripts/kconfig/mconf.o: $(deps_scripts/kconfig/mconf.o)

$(deps_scripts/kconfig/mconf.o):
