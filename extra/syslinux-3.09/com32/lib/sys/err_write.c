#ident "$Id: err_write.c,v 1.1 2004/11/23 23:43:02 hpa Exp $"
/* ----------------------------------------------------------------------- *
 *   
 *   Copyright 2004 H. Peter Anvin - All Rights Reserved
 *
 *   Permission is hereby granted, free of charge, to any person
 *   obtaining a copy of this software and associated documentation
 *   files (the "Software"), to deal in the Software without
 *   restriction, including without limitation the rights to use,
 *   copy, modify, merge, publish, distribute, sublicense, and/or
 *   sell copies of the Software, and to permit persons to whom
 *   the Software is furnished to do so, subject to the following
 *   conditions:
 *   
 *   The above copyright notice and this permission notice shall
 *   be included in all copies or substantial portions of the Software.
 *   
 *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 *   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 *   OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 *   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 *   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 *   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 *   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 *   OTHER DEALINGS IN THE SOFTWARE.
 *
 * ----------------------------------------------------------------------- */

/*
 * err_write.c
 *
 * Writing to a device which doesn't support writing
 */

#include <errno.h>
#include <string.h>
#include <com32.h>
#include <minmax.h>
#include "file.h"

static ssize_t __err_write(struct file_info *fp, const void *buf, size_t count)
{
  (void)fp; (void)buf; (void)count;
  errno = -EINVAL;
  return -1;
}

const struct output_dev dev_error_w = {
  .dev_magic = __DEV_MAGIC,
  .flags     = __DEV_OUTPUT | __DEV_ERROR,
  .fileflags = O_WRONLY | O_CREAT | O_TRUNC | O_APPEND,
  .write     = __err_write,
  .close     = NULL,
};
