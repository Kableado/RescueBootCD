/* -*- c -*- ------------------------------------------------------------- *
 *   
 *   Copyright 2004-2005 Murali Krishnan Ganapathy - All Rights Reserved
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, Inc., 53 Temple Place Ste 330,
 *   Boston MA 02111-1307, USA; either version 2 of the License, or
 *   (at your option) any later version; incorporated herein by reference.
 *
 * ----------------------------------------------------------------------- */

#ifndef __HELP_H_
#define __HELP_H_

#include "menu.h"
#include "com32io.h"
#include "tui.h"
#include <string.h>

// How many rows for the title
#define HELP_TITLE_HEIGHT 1
#define HELP_BODY_ROW (HELP_TITLE_HEIGHT+3)
#define HELP_LEFT_MARGIN 2
#define HELPBOX BOX_SINSIN
#define HELPDIRLEN  64

// Display one screen of help information
void showhelp(const char *filename);

// Start the help system using id helpid
void runhelpsystem(unsigned int helpid);

// Directory where help files are located
void init_help(const char *helpdir);
// Free internal datastructures
void close_help(void);

#endif
