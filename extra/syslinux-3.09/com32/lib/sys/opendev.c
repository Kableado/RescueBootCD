#ident "$Id: opendev.c,v 1.3 2004/11/23 23:43:02 hpa Exp $"
/* ----------------------------------------------------------------------- *
 *   
 *   Copyright 2003-2004 H. Peter Anvin - All Rights Reserved
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

#include <errno.h>
#include <com32.h>
#include <string.h>
#include "file.h"

/*
 * opendev.c
 *
 * Open a special device
 */

int opendev(const struct input_dev *idev, const struct output_dev *odev, int flags)
{
  int fd;
  struct file_info *fp;
  int okflags;

  okflags = (idev ? idev->fileflags : 0) | (odev ? odev->fileflags : 0);

  if ( !(flags & 3) || (flags & ~okflags) ) {
    errno = EINVAL;
    return -1;
  }

  for ( fd = 0, fp = __file_info ; fd < NFILES ; fd++, fp++ )
    if ( !fp->iop && !fp->oop )
      break;

  if ( fd >= NFILES ) {
    errno = EMFILE;
    return -1;
  }

  fp->iop         = idev ? idev : &dev_error_r;
  fp->oop         = odev ? odev : &dev_error_w;
  fp->i.offset    = 0;
  fp->i.nbytes    = 0;
  fp->i.datap     = fp->i.buf;

  return fd;
}
