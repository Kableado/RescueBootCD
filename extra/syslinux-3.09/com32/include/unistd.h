/*
 * unistd.h
 */

#ifndef _UNISTD_H
#define _UNISTD_H

#include <klibc/extern.h>
#include <klibc/compiler.h>
#include <stddef.h>
#include <sys/types.h>

__extern __noreturn _exit(int);

__extern int open(const char *, int, ...);
__extern int close(int);

__extern ssize_t read(int, void *, size_t);
__extern ssize_t write(int, const void *, size_t);

__extern int isatty(int);


/* Standard file descriptor numbers. */
#define STDIN_FILENO	0
#define STDOUT_FILENO	1
#define STDERR_FILENO	2

#endif /* _UNISTD_H */
