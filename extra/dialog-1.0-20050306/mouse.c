/*
 * $Id: mouse.c,v 1.12 2003/11/26 17:31:38 tom Exp $
 *
 * mouse.c -- mouse support for dialog
 *
 * Copyright 2002,2003	Thomas E. Dickey
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, write to the Free Software
 *   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 ********/

#include "dialog.h"

#if USE_MOUSE

static int basex, basey;

static mseRegion *regionList = NULL;

/*=========== region related functions =============*/

static mseRegion *
find_region_by_code(int code)
{
    mseRegion *butPtr;

    for (butPtr = regionList; butPtr; butPtr = butPtr->next) {
	if (code == butPtr->code)
	    break;
    }
    return butPtr;
}

void
dlg_mouse_setbase(int x, int y)
{
    basex = x;
    basey = y;
}

void
dlg_mouse_mkbigregion(int y, int x,
		      int height, int width,
		      int code,
		      int step_y, int step_x,
		      int mode)
{
    mseRegion *butPtr = dlg_mouse_mkregion(y, x, height, width, -(M_EVENT + code));
    butPtr->mode = mode;
    butPtr->step_x = MAX(1, step_x);
    butPtr->step_y = MAX(1, step_y);
}

void
dlg_mouse_free_regions(void)
{
    while (regionList != 0) {
	mseRegion *butPtr = regionList->next;
	free(regionList);
	regionList = butPtr;
    }
}

mseRegion *
dlg_mouse_mkregion(int y, int x, int height, int width, int code)
{
    mseRegion *butPtr;

    if ((butPtr = find_region_by_code(code)) == 0) {
	butPtr = malloc(sizeof(mseRegion));
	assert_ptr(butPtr, "dlg_mouse_mkregion");
	butPtr->next = regionList;
	regionList = butPtr;
    }
    if (butPtr != 0) {
	butPtr->mode = -1;
	butPtr->step_x = 0;
	butPtr->step_y = 0;
	butPtr->y = basey + y;
	butPtr->Y = basey + y + height;
	butPtr->x = basex + x;
	butPtr->X = basex + x + width;
	butPtr->code = code;
    }
    return butPtr;
}

/* retrieve the frame under the pointer */
static mseRegion *
any_mouse_region(int y, int x, int small)
{
    mseRegion *butPtr;

    for (butPtr = regionList; butPtr; butPtr = butPtr->next) {
	if (small ^ (butPtr->code >= 0))
	    continue;
	if (y < butPtr->y || y >= butPtr->Y)
	    continue;
	if (x < butPtr->x || x >= butPtr->X)
	    continue;
	break;			/* found */
    }
    return butPtr;
}

/* retrieve the frame under the pointer */
mseRegion *
dlg_mouse_region(int y, int x)
{
    return any_mouse_region(y, x, TRUE);
}

/* retrieve the bigframe under the pointer */
mseRegion *
dlg_mouse_bigregion(int y, int x)
{
    return any_mouse_region(y, x, FALSE);
}

#else
void mouse_dummy(void);
void
mouse_dummy(void)
{
}
#endif /* USE_MOUSE */
