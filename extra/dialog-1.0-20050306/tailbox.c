/*
 *  $Id: tailbox.c,v 1.41 2004/09/19 22:47:44 tom Exp $
 *
 *  tailbox.c -- implements the tail box
 *
 *  AUTHOR: Pasquale De Marco (demarco_p@abramo.it)
 *     and: Thomas E. Dickey
 *
 *  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public License
 *  as published by the Free Software Foundation; either version 2
 *  of the License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

#include "dialog.h"

typedef struct {
    DIALOG_CALLBACK obj;
    WINDOW *text;
    const char **buttons;
    int hscroll;
    int old_hscroll;
    char line[MAX_LEN + 1];
} MY_OBJ;

/*
 * Return current line of text.
 */
static char *
get_line(MY_OBJ * obj)
{
    FILE *fp = obj->obj.input;
    int col = -(obj->hscroll);
    int j, tmpint, ch;

    do {
	if (((ch = getc(fp)) == EOF) && !feof(fp))
	    dlg_exiterr("Error moving file pointer in get_line().");
	else if (!feof(fp) && (ch != '\n')) {
	    if ((ch == TAB) && (dialog_vars.tab_correct)) {
		tmpint = dialog_state.tab_len
		    - ((col + obj->hscroll) % dialog_state.tab_len);
		for (j = 0; j < tmpint; j++) {
		    if (col >= 0 && col < MAX_LEN)
			obj->line[col] = ' ';
		    ++col;
		}
	    } else {
		if (col >= 0)
		    obj->line[col] = ch;
		++col;
	    }
	    if (col >= MAX_LEN)
		break;
	}
    } while (!feof(fp) && (ch != '\n'));

    if (col < 0)
	col = 0;
    obj->line[col] = '\0';

    return obj->line;
}

/*
 * Print a new line of text.
 */
static void
print_line(MY_OBJ * obj, WINDOW *win, int row, int width)
{
    int i, y, x;
    char *line = get_line(obj);

    (void) wmove(win, row, 0);	/* move cursor to correct line */
    (void) waddch(win, ' ');
#ifdef NCURSES_VERSION
    (void) waddnstr(win, line, MIN((int) strlen(line), width - 2));
#else
    line[MIN((int) strlen(line), width - 2)] = '\0';
    waddstr(win, line);
#endif

    getyx(win, y, x);
    /* Clear 'residue' of previous line */
    for (i = 0; i < width - x; i++)
	(void) waddch(win, ' ');
}

/*
 * Go back 'target' lines in text file.  BUFSIZ has to be in 'size_t' range.
 */
static void
last_lines(MY_OBJ * obj, int target)
{
    FILE *fp = obj->obj.input;
    int inx;
    int count = 0;
    char buf[BUFSIZ + 1];
    size_t size_to_read;
    size_t offset = 0;
    long fpos = 0;

    if (fseek(fp, 0, SEEK_END) == -1
	|| (fpos = ftell(fp)) < 0)
	dlg_exiterr("Error moving file pointer in last_lines().");

    if (fpos != 0) {
	++target;
	for (;;) {
	    if (fpos >= BUFSIZ) {
		size_to_read = (size_t) BUFSIZ;
	    } else {
		size_to_read = ((size_t) fpos);
	    }
	    fpos -= size_to_read;
	    if (fseek(fp, fpos, SEEK_SET) == -1)
		dlg_exiterr("Error moving file pointer in last_lines().");
	    (void) fread(buf, size_to_read, 1, fp);
	    if (ferror(fp))
		dlg_exiterr("Error reading file in last_lines().");

	    offset += size_to_read;
	    for (inx = size_to_read - 1; inx >= 0; --inx) {
		if (buf[inx] == '\n') {
		    if (++count > target)
			break;
		    offset = inx + 1;
		}
	    }

	    if (count > target) {
		break;
	    } else if (fpos == 0) {
		offset = 0;
		break;
	    }
	}

	if (fseek(fp, fpos + offset, SEEK_SET) == -1)
	    dlg_exiterr("Error moving file pointer in last_lines().");
    }
}

/*
 * Print a new page of text.
 */
static void
print_page(MY_OBJ * obj, int height, int width)
{
    int i;

    for (i = 0; i < height; i++) {
	print_line(obj, obj->text, i, width);
    }
    (void) wnoutrefresh(obj->text);
}

static void
print_last_page(MY_OBJ * obj)
{
    int high = getmaxy(obj->obj.win) - (2 * MARGIN + (obj->obj.bg_task ? 1 : 3));
    int wide = getmaxx(obj->text);

    last_lines(obj, high);
    print_page(obj, high, wide);
}

static void
repaint_text(MY_OBJ * obj)
{
    int cur_y, cur_x;

    getyx(obj->obj.win, cur_y, cur_x);
    obj->old_hscroll = obj->hscroll;
    print_last_page(obj);
    (void) wmove(obj->obj.win, cur_y, cur_x);	/* Restore cursor position */
    wrefresh(obj->obj.win);
}

static bool
handle_my_getc(DIALOG_CALLBACK * cb, int ch, int fkey, int *result)
{
    MY_OBJ *obj = (MY_OBJ *) cb;
    bool done = FALSE;

    if (!fkey) {
	fkey = TRUE;
	switch (ch) {
	case '\n':
	case '\r':
	    ch = KEY_ENTER;
	    break;
	case 'H':
	case 'h':
	    ch = KEY_LEFT;
	    break;
	case 'L':
	case 'l':
	    ch = KEY_RIGHT;
	    break;
	case '0':
	    ch = KEY_BEG;
	    break;
	default:
	    if (dlg_char_to_button(ch, obj->buttons) == 0) {
		ch = KEY_ENTER;
	    } else {
		fkey = FALSE;
	    }
	    break;
	}
    }
    if (fkey) {
	switch (ch) {
	case KEY_ENTER:
	    *result = DLG_EXIT_OK;
	    done = TRUE;
	    break;
	case KEY_BEG:		/* Beginning of line */
	    obj->hscroll = 0;
	    break;
	case KEY_LEFT:		/* Scroll left */
	    if (obj->hscroll > 0) {
		obj->hscroll -= 1;
	    }
	    break;
	case KEY_RIGHT:	/* Scroll right */
	    if (obj->hscroll < MAX_LEN)
		obj->hscroll += 1;
	    break;
	default:
	    beep();
	    break;
	}
    } else {
	switch (ch) {
	case ERR:
	    ch = getc(cb->input);
	    (void) ungetc(ch, cb->input);
	    if ((ch != EOF) || (obj->hscroll != obj->old_hscroll)) {
		repaint_text(obj);
	    }
	    break;
	case ESC:
	    done = TRUE;
	    *result = DLG_EXIT_ESC;
	    break;
	default:
	    beep();
	    break;
	}
    }

    return !done;
}

/*
 * Display text from a file in a dialog box, like in a "tail -f".
 */
int
dialog_tailbox(const char *title, const char *file, int height, int width, int bg_task)
{
    int fkey;
    int x, y, result, thigh;
    WINDOW *dialog, *text;
    const char **buttons = 0;
    MY_OBJ *obj;
    FILE *fd;

    dlg_auto_sizefile(title, file, &height, &width, 2, 12);
    dlg_print_size(height, width);
    dlg_ctl_size(height, width);

    /* Open input file for reading */
    if ((fd = fopen(file, "rb")) == NULL)
	dlg_exiterr("Can't open input file in dialog_tailbox().");

    x = dlg_box_x_ordinate(width);
    y = dlg_box_y_ordinate(height);
    thigh = height - ((2 * MARGIN) + (bg_task ? 0 : 2));

    dialog = dlg_new_window(height, width, y, x);

    dlg_mouse_setbase(x, y);

    /* Create window for text region, used for scrolling text */
    text = dlg_sub_window(dialog,
			  thigh,
			  width - (2 * MARGIN),
			  y + MARGIN,
			  x + MARGIN);

    dlg_draw_box(dialog, 0, 0, height, width, dialog_attr, border_attr);
    dlg_draw_bottom_box(dialog);
    dlg_draw_title(dialog, title);

    if (!bg_task) {
	buttons = dlg_exit_label();
	dlg_draw_buttons(dialog, height - (2 * MARGIN), 0, buttons, FALSE,
			 FALSE, width);
    }

    (void) wmove(dialog, thigh, (MARGIN + 1));
    (void) wnoutrefresh(dialog);

    obj = (MY_OBJ *) calloc(1, sizeof(MY_OBJ));
    assert_ptr(obj, "dialog_tailbox");

    obj->obj.input = fd;
    obj->obj.win = dialog;
    obj->obj.handle_getc = handle_my_getc;
    obj->obj.keep_bg = bg_task && dialog_vars.cant_kill;
    obj->obj.bg_task = bg_task;
    obj->text = text;
    obj->buttons = buttons;
    dlg_add_callback(&(obj->obj));

    /* Print last page of text */
    dlg_attr_clear(text, thigh, getmaxx(text), dialog_attr);
    repaint_text(obj);

    if (bg_task) {
	result = DLG_EXIT_OK;
    } else {
	int ch;
	do {
	    ch = dlg_getc(dialog, &fkey);
	}
	while (handle_my_getc(&(obj->obj), ch, fkey, &result));
    }
    dlg_mouse_free_regions();
    return result;
}
