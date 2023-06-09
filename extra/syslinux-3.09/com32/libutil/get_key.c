#ident "$Id: get_key.c,v 1.7 2005/01/21 01:35:33 hpa Exp $"
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
 * get_key.c
 *
 * Get a single key, and try to pick apart function key codes.
 * This doesn't decode anywhere close to all possiblities, but
 * hopefully is enough to be useful.
 */

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <time.h>
#include <sys/times.h>
#include <getkey.h>
#include <libutil.h>

struct keycode {
  int code;
  int seqlen;
  const unsigned char *seq;
};

#define MAXLEN 8
#define CODE(x,y) { x, (sizeof y)-1, y }

static const struct keycode keycodes[] = {
  /* First, the BIOS combined codes */
  CODE(KEY_F1,   "\0\x3B"),
  CODE(KEY_F2,   "\0\x3C"),
  CODE(KEY_F3,   "\0\x3D"),
  CODE(KEY_F4,   "\0\x3E"),
  CODE(KEY_F5,   "\0\x3F"),
  CODE(KEY_F6,   "\0\x40"),
  CODE(KEY_F7,   "\0\x41"),
  CODE(KEY_F8,   "\0\x42"),
  CODE(KEY_F9,   "\0\x43"),
  CODE(KEY_F10,  "\0\x44"),
  CODE(KEY_F11,  "\0\x85"),
  CODE(KEY_F12,  "\0\x86"),

  CODE(KEY_UP,   "\0\x48"),
  CODE(KEY_DOWN, "\0\x50"),
  CODE(KEY_LEFT, "\0\x4B"),
  CODE(KEY_RIGHT,"\0\x4D"),
  CODE(KEY_PGUP, "\0\x49"),
  CODE(KEY_PGDN, "\0\x51"),
  CODE(KEY_HOME, "\0\x47"),
  CODE(KEY_END,  "\0\x4F"),
  CODE(KEY_INSERT, "\0\x52"),
  CODE(KEY_DELETE, "\0\x53"),

  /* Now, VT/xterm/Linux codes */
  CODE(KEY_F1,   "\033[[A"),
  CODE(KEY_F1,   "\033OP"),
  CODE(KEY_F2,   "\033[[B"),
  CODE(KEY_F2,   "\033OQ"),
  CODE(KEY_F3,   "\033[[C"),
  CODE(KEY_F3,   "\033OR"),
  CODE(KEY_F4,   "\033[[D"),
  CODE(KEY_F4,   "\033OS"),
  CODE(KEY_F5,   "\033[[E"),
  CODE(KEY_F5,   "\033[15~"),
  CODE(KEY_F6,   "\033[17~"),
  CODE(KEY_F7,   "\033[18~"),
  CODE(KEY_F8,   "\033[19~"),
  CODE(KEY_F9,   "\033[20~"),
  CODE(KEY_F10,  "\033[21~"),
  CODE(KEY_F11,  "\033[23~"),
  CODE(KEY_F12,  "\033[24~"),

  CODE(KEY_UP,   "\033[A"),
  CODE(KEY_DOWN, "\033[B"),
  CODE(KEY_LEFT, "\033[D"),
  CODE(KEY_RIGHT,"\033[C"),
  CODE(KEY_PGUP, "\033[5~"),
  CODE(KEY_PGUP, "\033[V"),
  CODE(KEY_PGDN, "\033[6~"),
  CODE(KEY_PGDN, "\033[U"),
  CODE(KEY_HOME, "\033[1~"),
  CODE(KEY_HOME, "\033[H"),
  CODE(KEY_END,  "\033[4~"),
  CODE(KEY_END,  "\033[F"),
  CODE(KEY_END,  "\033OF"),
  CODE(KEY_INSERT, "\033[2~"),
  CODE(KEY_INSERT, "\033[@"),
  CODE(KEY_DELETE, "\033[3~"),
};
#define NCODES ((int)(sizeof keycodes/sizeof(struct keycode)))

int get_key(FILE *f, clock_t timeout)
{
  unsigned char buffer[MAXLEN];
  int nc, i, rv;
  const struct keycode *kc;
  int another;
  unsigned char ch;
  clock_t start;

  /* We typically start in the middle of a clock tick */
  if ( timeout )
    timeout++;

  nc = 0;
  start = times(NULL);
  do {
    rv = read(fileno(f), &ch, 1);
    if ( rv == 0 || (rv == -1 && errno == EAGAIN) ) {
      clock_t lateness = times(NULL)-start;
      if ( nc && lateness > 1+CLK_TCK/20 )
	return buffer[0];	/* timeout in sequence */
      else if ( !nc && timeout && lateness > timeout )
	return KEY_NONE;	/* timeout before sequence */

      do_idle();

      another = 1;
      continue;
    }

    start = times(NULL);

    buffer[nc++] = ch;

    another = 0;
    for ( i = 0, kc = keycodes ; i < NCODES ; i++, kc++ ) {
      if ( nc == kc->seqlen && !memcmp(buffer, kc->seq, nc) )
	return kc->code;
      else if ( nc < kc->seqlen && !memcmp(buffer, kc->seq, nc) ) {
	another = 1;
	break;
      }
    }
  } while ( another );

  /* We got an unrecognized sequence; return the first character */
  /* We really should remember this and return subsequent characters later */
  return buffer[0];
}
	

    

    
