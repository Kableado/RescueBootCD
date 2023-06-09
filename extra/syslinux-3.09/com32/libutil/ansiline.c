#ident "$Id: ansiline.c,v 1.1 2004/12/01 01:30:07 hpa Exp $"
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
 * ansiline.c
 *
 * Configures the console for ANSI output in line mode; versions
 * for COM32 and Linux support.
 */

#ifdef __COM32__

#include <stdio.h>
#include <unistd.h>
#include <console.h>

static void __attribute__((destructor)) console_cleanup(void)
{
  /* For the serial console, be nice and clean up */
  fputs("\033[0m\033[20l", stdout);
}

void console_ansi_std(void)
{
  openconsole(&dev_stdcon_r, &dev_ansiserial_w);
  fputs("\033[0m\033[20h", stdout);
}

#else 

#include <stdio.h>
#include <termios.h>

static struct termios original_termios_settings;

static void __attribute__((constructor)) console_init(void)
{
  tcgetattr(0, &original_termios_settings);
}

static void __attribute__((destructor)) console_cleanup(void)
{
  fputs("\033[0m\033[20l", stdout);
  tcsetattr(0, TCSANOW, &original_termios_settings);
}
  

void console_ansi_std(void)
{
  struct termios tio;

  /* Disable stdio buffering */
  setbuf(stdin,  NULL);
  setbuf(stdout, NULL);
  setbuf(stderr, NULL);

  /* Set the termios flag so we behave the same as libcom32 */
  tcgetattr(0, &tio);
  tio.c_iflag &= ~ICRNL;
  tio.c_iflag |= IGNCR;
  tio.c_cflag |= ICANON|ECHO;
  tcsetattr(0, TCSANOW, &tio);
  fputs("\033[0m\033[20h", stdout);
}

#endif

