/*
 *  $Id: textbox.c,v 1.57 2004/12/20 20:47:15 tom Exp $
 *
 *  textbox.c -- implements the text box
 *
 *  AUTHOR: Savio Lam (lam836@cs.cuhk.hk)
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
    char line[MAX_LEN + 1];
    int fd;
    long file_size;
    long fd_bytes_read;
    long bytes_read;
    long buffer_len;
    bool begin_reached;
    bool buffer_first;
    bool end_reached;
    long page_length;		/* lines on the page which is shown */
    long in_buf;		/* ending index into buf[] for page */
    char *buf;
} MY_OBJ;

static long
lseek_obj(MY_OBJ * obj, long offset, int mode)
{
    long fpos;
    if ((fpos = lseek(obj->fd, offset, mode)) == -1) {
	switch (mode) {
	case SEEK_CUR:
	    dlg_exiterr("Cannot get file position");
	    break;
	case SEEK_END:
	    dlg_exiterr("Cannot seek to end of file");
	    break;
	case SEEK_SET:
	    dlg_exiterr("Cannot set file position to %ld", offset);
	    break;
	}
    }
    return fpos;
}

static long
ftell_obj(MY_OBJ * obj)
{
    return lseek_obj(obj, 0, SEEK_CUR);
}

static char *
xalloc(long size)
{
    char *result = malloc(size);
    assert_ptr(result, "xalloc");
    return result;
}

/*
 * read_high() substitutes read() for tab->spaces conversion
 *
 * buffer_len, fd_bytes_read, bytes_read are modified
 * buf is allocated
 *
 * fd_bytes_read is the effective number of bytes read from file
 * bytes_read is the length of buf, that can be different if tab_correct
 */
static void
read_high(MY_OBJ * obj, size_t size_read)
{
    char *buftab, ch;
    int i = 0, j, n, tmpint;
    long begin_line;

    /* Allocate space for read buffer */
    buftab = xalloc(size_read + 1);

    if ((obj->fd_bytes_read = read(obj->fd, buftab, size_read)) != -1) {

	buftab[obj->fd_bytes_read] = '\0';	/* mark end of valid data */

	if (dialog_vars.tab_correct) {

	    /* calculate bytes_read by buftab and fd_bytes_read */
	    obj->bytes_read = begin_line = 0;
	    for (j = 0; j < obj->fd_bytes_read; j++)
		if (buftab[j] == TAB)
		    obj->bytes_read += dialog_state.tab_len
			- ((obj->bytes_read - begin_line)
			   % dialog_state.tab_len);
		else if (buftab[j] == '\n') {
		    obj->bytes_read++;
		    begin_line = obj->bytes_read;
		} else
		    obj->bytes_read++;

	    if (obj->bytes_read > obj->buffer_len) {
		if (obj->buffer_first)
		    obj->buffer_first = FALSE;	/* disp = 0 */
		else {
		    free(obj->buf);
		}

		obj->buffer_len = obj->bytes_read;

		/* Allocate space for read buffer */
		obj->buf = xalloc(obj->buffer_len + 1);
	    }

	} else {
	    if (obj->buffer_first) {
		obj->buffer_first = FALSE;

		/* Allocate space for read buffer */
		obj->buf = xalloc(size_read + 1);
	    }

	    obj->bytes_read = obj->fd_bytes_read;
	}

	j = 0;
	begin_line = 0;
	while (j < obj->fd_bytes_read)
	    if (((ch = buftab[j++]) == TAB) && (dialog_vars.tab_correct != 0)) {
		tmpint = (dialog_state.tab_len
			  - ((int) ((long) i - begin_line) % dialog_state.tab_len));
		for (n = 0; n < tmpint; n++)
		    obj->buf[i++] = ' ';
	    } else {
		if (ch == '\n')
		    begin_line = i + 1;
		obj->buf[i++] = ch;
	    }

	obj->buf[i] = '\0';	/* mark end of valid data */

    }
    if (obj->bytes_read == -1)
	dlg_exiterr("Error reading file");
    free(buftab);
}

static long
tabize(MY_OBJ * obj, long val, int pos)
{
    long fpos;
    long i, count, begin_line;
    char *buftab;

    if (!dialog_vars.tab_correct)
	return val;

    fpos = ftell_obj(obj);

    lseek_obj(obj, fpos - obj->fd_bytes_read, SEEK_SET);

    /* Allocate space for read buffer */
    buftab = xalloc(val + 1);

    if ((read(obj->fd, buftab, val)) == -1)
	dlg_exiterr("Error reading file in tabize().");

    begin_line = count = 0;
    for (i = 0; i < val; i++) {
	if (pos && count >= val) {
	    count = i;		/* it's the retval */
	    break;
	}
	if (buftab[i] == TAB)
	    count += dialog_state.tab_len
		- ((count - begin_line) % dialog_state.tab_len);
	else if (buftab[i] == '\n') {
	    count++;
	    begin_line = count;
	} else
	    count++;
    }

    lseek_obj(obj, fpos, SEEK_SET);
    free(buftab);
    return count;
}
/*
 * Return current line of text.
 * 'page' should point to start of current line before calling, and will be
 * updated to point to start of next line.
 */
static char *
get_line(MY_OBJ * obj)
{
    int i = 0;
    long fpos;

    obj->end_reached = FALSE;
    while (obj->buf[obj->in_buf] != '\n') {
	if (obj->buf[obj->in_buf] == '\0') {	/* Either end of file or end of buffer reached */
	    fpos = ftell_obj(obj);

	    if (fpos < obj->file_size) {	/* Not end of file yet */
		/* We've reached end of buffer, but not end of file yet, so
		 * read next part of file into buffer
		 */
		read_high(obj, BUF_SIZE);
		obj->in_buf = 0;
	    } else {
		if (!obj->end_reached)
		    obj->end_reached = TRUE;
		break;
	    }
	} else if (i < MAX_LEN)
	    obj->line[i++] = obj->buf[obj->in_buf++];
	else {
	    if (i == MAX_LEN)	/* Truncate lines longer than MAX_LEN characters */
		obj->line[i++] = '\0';
	    obj->in_buf++;
	}
    }
    if (i <= MAX_LEN)
	obj->line[i] = '\0';
    if (!obj->end_reached)
	obj->in_buf++;		/* move pass '\n' */

    return obj->line;
}

static bool
match_string(MY_OBJ * obj, char *string)
{
    char *match = get_line(obj);
    return strstr(match, string) != 0;
}

/*
 * Go back 'n' lines in text file. Called by dialog_textbox().
 * 'in_buf' will be updated to point to the desired line in 'buf'.
 */
static void
back_lines(MY_OBJ * obj, long n)
{
    int i;
    long fpos;
    long val_to_tabize;

    obj->begin_reached = FALSE;
    /* We have to distinguish between end_reached and !end_reached since at end
       * of file, the line is not ended by a '\n'.  The code inside 'if'
       * basically does a '--in_buf' to move one character backward so as to
       * skip '\n' of the previous line */
    if (!obj->end_reached) {
	/* Either beginning of buffer or beginning of file reached? */

	if (obj->in_buf == 0) {
	    fpos = ftell_obj(obj);

	    if (fpos > obj->fd_bytes_read) {	/* Not beginning of file yet */
		/* We've reached beginning of buffer, but not beginning of file
		 * yet, so read previous part of file into buffer.  Note that
		 * we only move backward for BUF_SIZE/2 bytes, but not BUF_SIZE
		 * bytes to avoid re-reading again in print_page() later
		 */
		/* Really possible to move backward BUF_SIZE/2 bytes? */
		if (fpos < BUF_SIZE / 2 + obj->fd_bytes_read) {
		    /* No, move less then */
		    lseek_obj(obj, 0, SEEK_SET);
		    val_to_tabize = fpos - obj->fd_bytes_read;
		} else {	/* Move backward BUF_SIZE/2 bytes */
		    lseek_obj(obj, -(BUF_SIZE / 2 + obj->fd_bytes_read), SEEK_CUR);
		    val_to_tabize = BUF_SIZE / 2;
		}
		read_high(obj, BUF_SIZE);

		obj->in_buf = tabize(obj, val_to_tabize, 0);

	    } else {		/* Beginning of file reached */
		obj->begin_reached = TRUE;
		return;
	    }
	}
	obj->in_buf--;
	if (obj->buf[obj->in_buf] != '\n')
	    /* Something's wrong... */
	    dlg_exiterr("Internal error in back_lines().");
    }

    /* Go back 'n' lines */
    for (i = 0; i < n; i++) {
	do {
	    if (obj->in_buf == 0) {
		fpos = ftell_obj(obj);

		if (fpos > obj->fd_bytes_read) {
		    /* Really possible to move backward BUF_SIZE/2 bytes? */
		    if (fpos < BUF_SIZE / 2 + obj->fd_bytes_read) {
			/* No, move less then */
			lseek_obj(obj, 0, SEEK_SET);
			val_to_tabize = fpos - obj->fd_bytes_read;
		    } else {	/* Move backward BUF_SIZE/2 bytes */
			lseek_obj(obj, -(BUF_SIZE / 2 + obj->fd_bytes_read), SEEK_CUR);
			val_to_tabize = BUF_SIZE / 2;
		    }
		    read_high(obj, BUF_SIZE);

		    obj->in_buf = tabize(obj, val_to_tabize, 0);

		} else {	/* Beginning of file reached */
		    obj->begin_reached = TRUE;
		    return;
		}
	    }
	} while (obj->buf[--(obj->in_buf)] != '\n');
    }
    obj->in_buf++;
}

/*
 * Print a new line of text.
 */
static void
print_line(MY_OBJ * obj, int row, int width)
{
    int i, y, x;
    char *line;

    line = get_line(obj);
    line += MIN((int) strlen(line), obj->hscroll);	/* Scroll horizontally */
    (void) wmove(obj->text, row, 0);	/* move cursor to correct line */
    (void) waddch(obj->text, ' ');
#ifdef NCURSES_VERSION
    (void) waddnstr(obj->text, line, MIN((int) strlen(line), width - 2));
#else
    line[MIN((int) strlen(line), width - 2)] = '\0';
    waddstr(obj->text, line);
#endif

    getyx(obj->text, y, x);
    /* Clear 'residue' of previous line */
    for (i = 0; i < width - x; i++)
	(void) waddch(obj->text, ' ');
}

/*
 * Print a new page of text.
 */
static void
print_page(MY_OBJ * obj, int height, int width)
{
    int i, passed_end = 0;

    obj->page_length = 0;
    for (i = 0; i < height; i++) {
	print_line(obj, i, width);
	if (!passed_end)
	    obj->page_length++;
	if (obj->end_reached && !passed_end)
	    passed_end = 1;
    }
    (void) wnoutrefresh(obj->text);
}

/*
 * Print current position
 */
static void
print_position(MY_OBJ * obj, WINDOW *win, int height, int width)
{
    chtype save = getattrs(win);
    long fpos;
    long size;
    int percent;
    int len;
    char buffer[5];

    fpos = ftell_obj(obj);
    size = tabize(obj, obj->in_buf, 1);

    wattrset(win, position_indicator_attr);
    percent = (!obj->file_size
	       ? 100
	       : (int) (((fpos - obj->fd_bytes_read + size) * 100)
			/ obj->file_size));

    if (percent < 0)
	percent = 0;
    if (percent > 100)
	percent = 100;

    (void) sprintf(buffer, "%d%%", percent);
    (void) wmove(win, height - 3, width - 9);
    (void) waddstr(win, buffer);
    if ((len = strlen(buffer)) < 4) {
	wattrset(win, border_attr);
	whline(win, ACS_HLINE, 4 - len);
    }

    wattrset(win, save);
    dlg_draw_arrows2(win,
		     fpos > obj->fd_bytes_read - size,
		     size < obj->fd_bytes_read,
		     5, 0, height - 3,
		     dialog_attr,
		     border_attr);
}

/*
 * Display a dialog box and get the search term from user.
 */
static int
get_search_term(WINDOW *dialog, char *input, int height, int width)
{
    chtype save = getattrs(dialog);
    int box_x, box_y, key = 0;
    int box_height, box_width;
    int offset = 0;
    int fkey = 0;
    bool first = TRUE;
    int result = DLG_EXIT_UNKNOWN;
    char *caption = _("Search");
    int len_caption = dlg_count_columns(caption);
    const int *indx;
    int limit;

    box_height = 1 + (2 * MARGIN);
    box_width = len_caption + (2 * (MARGIN + 2));
    box_width = MAX(box_width, 30);
    box_width = MIN(box_width, getmaxx(dialog) - 2 * MARGIN);
    len_caption = MIN(len_caption, box_width - (2 * (MARGIN + 1)));

    box_x = (width - box_width) / 2;
    box_y = (height - box_height) / 2;
#ifdef HAVE_COLOR
    if (dialog_state.use_shadow)
	dlg_draw_shadow(dialog, box_y, box_x, box_height, box_width);
#endif
    dlg_draw_box(dialog, box_y, box_x, box_height, box_width,
		 searchbox_attr,
		 searchbox_border_attr);
    wattrset(dialog, searchbox_title_attr);
    (void) wmove(dialog, box_y, (width - len_caption) / 2);

    indx = dlg_index_wchars(caption);
    limit = dlg_limit_columns(caption, len_caption, 0);
    (void) waddnstr(dialog, caption + indx[0], indx[limit] - indx[0]);

    box_y++;
    box_x++;
    box_width -= 2;
    input[0] = '\0';

    for (;;) {
	if (!first) {
	    key = dlg_getc(dialog, &fkey);
	    if (key == ESC) {
		result = DLG_EXIT_ESC;
		break;
	    } else if (key == '\n') {
		result = DLG_EXIT_OK;
		break;
	    }
	}
	if (dlg_edit_string(input, &offset, key, fkey, first)) {
	    dlg_show_string(dialog, input, offset, searchbox_attr,
			    box_y, box_x, box_width, FALSE, first);
	    first = FALSE;
	}
    }
    wattrset(dialog, save);
    return result;
}

static bool
perform_search(MY_OBJ * obj, int height, int width, int key, char *search_term)
{
    int dir;
    long tempinx;
    long fpos;
    bool found;
    bool temp, temp1;
    bool moved = FALSE;

    /* set search direction */
    dir = (key == '/' || key == 'n') ? 1 : 0;
    if (dir ? !obj->end_reached : !obj->begin_reached) {
	if (key == 'n' || key == 'N') {
	    if (search_term[0] == '\0') {	/* No search term yet */
		(void) beep();
		return FALSE;
	    }
	    /* Get search term from user */
	} else if (get_search_term(obj->text, search_term,
				   height - 4,
				   width - 2) == DLG_EXIT_ESC
		   || search_term[0] == '\0') {
	    /* ESC pressed, or no search term, reprint page to clear box */
	    wattrset(obj->text, dialog_attr);
	    back_lines(obj, obj->page_length);
	    return TRUE;
	}
	/* Save variables for restoring in case search term can't be found */
	tempinx = obj->in_buf;
	temp = obj->begin_reached;
	temp1 = obj->end_reached;
	fpos = ftell_obj(obj) - obj->fd_bytes_read;
	/* update 'in_buf' to point to next (previous) line before
	   forward (backward) searching */
	back_lines(obj, (dir
			 ? obj->page_length - 1
			 : obj->page_length + 1));
	found = FALSE;
	if (dir) {		/* Forward search */
	    while ((found = match_string(obj, search_term)) == FALSE) {
		if (obj->end_reached)
		    break;
	    }
	} else {		/* Backward search */
	    while ((found = match_string(obj, search_term)) == FALSE) {
		if (obj->begin_reached)
		    break;
		back_lines(obj, 2);
	    }
	}
	if (found == FALSE) {	/* not found */
	    (void) beep();
	    /* Restore program state to that before searching */
	    lseek_obj(obj, fpos, SEEK_SET);

	    read_high(obj, BUF_SIZE);

	    obj->in_buf = tempinx;
	    obj->begin_reached = temp;
	    obj->end_reached = temp1;
	    /* move 'in_buf' to point to start of current page to
	     * re-print current page.  Note that 'in_buf' always points
	     * to start of next page, so this is necessary
	     */
	    back_lines(obj, obj->page_length);
	} else {		/* Search term found */
	    back_lines(obj, 1);
	}
	/* Reprint page */
	wattrset(obj->text, dialog_attr);
	moved = TRUE;
    } else {			/* no need to find */
	(void) beep();
    }
    return moved;
}

/*
 * Display text from a file in a dialog box.
 */
int
dialog_textbox(const char *title, const char *file, int height, int width)
{
    long fpos;
    int x, y, cur_x, cur_y;
    int key = 0, fkey;
    int next = 0;
#ifdef NCURSES_VERSION
    int i, passed_end;
#endif
    char search_term[MAX_LEN + 1];
    MY_OBJ obj;
    WINDOW *dialog;
    bool moved = TRUE;
    int result = DLG_EXIT_UNKNOWN;

    dlg_auto_sizefile(title, file, &height, &width, 2, 12);
    dlg_print_size(height, width);
    dlg_ctl_size(height, width);

    search_term[0] = '\0';	/* no search term entered yet */

    memset(&obj, 0, sizeof(obj));

    obj.begin_reached = TRUE;
    obj.buffer_first = TRUE;
    obj.end_reached = FALSE;
    obj.buttons = dlg_exit_label();

    /* Open input file for reading */
    if ((obj.fd = open(file, O_RDONLY)) == -1)
	dlg_exiterr("Can't open input file %s", file);

    /* Get file size. Actually, 'file_size' is the real file size - 1,
       since it's only the last byte offset from the beginning */
    obj.file_size = lseek_obj(&obj, 0, SEEK_END);

    /* Restore file pointer to beginning of file after getting file size */
    lseek_obj(&obj, 0, SEEK_SET);

    read_high(&obj, BUF_SIZE);

    x = dlg_box_x_ordinate(width);
    y = dlg_box_y_ordinate(height);

    dialog = dlg_new_window(height, width, y, x);

    dlg_mouse_setbase(x, y);

    /* Create window for text region, used for scrolling text */
    obj.text = dlg_sub_window(dialog, height - 4, width - 2, y + 1, x + 1);

    /* register the new window, along with its borders */
    dlg_mouse_mkbigregion(0, 0, height - 2, width, KEY_MAX, 1, 1, 3 /* cells */ );
    dlg_draw_box(dialog, 0, 0, height, width, dialog_attr, border_attr);
    dlg_draw_bottom_box(dialog);
    dlg_draw_title(dialog, title);

    dlg_draw_buttons(dialog, height - 2, 0, obj.buttons, FALSE, FALSE, width);
    (void) wnoutrefresh(dialog);
    getyx(dialog, cur_y, cur_x);	/* Save cursor position */

    dlg_attr_clear(obj.text, height - 4, width - 2, dialog_attr);

    while (result == DLG_EXIT_UNKNOWN) {

	/*
	 * Update the screen according to whether we shifted up/down by a line
	 * or not.
	 */
	if (moved) {
	    if (next < 0) {
		(void) scrollok(obj.text, TRUE);
		(void) scroll(obj.text);	/* Scroll text region up one line */
		(void) scrollok(obj.text, FALSE);
		print_line(&obj, height - 5, width - 2);
#ifndef NCURSES_VERSION
		wmove(obj.text, height - 5, 0);
		waddch(obj.text, ' ');
		wmove(obj.text, height - 5, width - 3);
		waddch(obj.text, ' ');
#endif
		(void) wnoutrefresh(obj.text);
	    } else if (next > 0) {
#ifdef NCURSES_VERSION
		/*
		 * We don't call print_page() here but use scrolling to ensure
		 * faster screen update.  However, 'end_reached' and
		 * 'page_length' should still be updated, and 'in_buf' should
		 * point to start of next page.  This is done by calling
		 * get_line() in the following 'for' loop.
		 */
		(void) scrollok(obj.text, TRUE);
		(void) wscrl(obj.text, -1);	/* Scroll text region down one line */
		(void) scrollok(obj.text, FALSE);
		obj.page_length = 0;
		passed_end = 0;
		for (i = 0; i < height - 4; i++) {
		    if (!i) {
			print_line(&obj, 0, width - 2);		/* print first line of page */
			(void) wnoutrefresh(obj.text);
		    } else
			(void) get_line(&obj);	/* Called to update 'end_reached' and 'in_buf' */
		    if (!passed_end)
			obj.page_length++;
		    if (obj.end_reached && !passed_end)
			passed_end = 1;
		}
#else
		print_page(&obj, height - 4, width - 2);
#endif
	    } else {
		print_page(&obj, height - 4, width - 2);
	    }
	    print_position(&obj, dialog, height, width);
	    (void) wmove(dialog, cur_y, cur_x);		/* Restore cursor position */
	    wrefresh(dialog);
	}
	moved = FALSE;		/* assume we'll not move */
	next = 0;		/* ...but not scroll by a line */

	key = dlg_mouse_wgetch(dialog, &fkey);

	if (!fkey) {
	    fkey = TRUE;
	    switch (key) {
	    case ESC:
		result = DLG_EXIT_ESC;
		continue;
	    case '\n':
	    case '\r':
		key = KEY_ENTER;
		break;
	    case ' ':
		key = KEY_NPAGE;
		break;
	    case '0':
		key = KEY_BEG;
		break;
	    case 'B':
	    case 'b':
		key = KEY_PPAGE;
		break;
	    case 'g':
		key = KEY_HOME;
		break;
	    case 'G':
		key = KEY_END;
		break;
	    case 'H':
	    case 'h':
		key = KEY_LEFT;
		break;
	    case 'K':
	    case 'k':
		key = KEY_UP;
		break;
	    case 'J':
	    case 'j':
		key = KEY_DOWN;
		break;
	    case 'L':
	    case 'l':
		key = KEY_RIGHT;
		break;
	    case '/':		/* Forward search */
	    case 'n':		/* Repeat forward search */
	    case '?':		/* Backward search */
	    case 'N':		/* Repeat backward search */
		moved = perform_search(&obj, height, width, key, search_term);
		fkey = FALSE;
		break;
	    default:
		if (dlg_char_to_button(key, obj.buttons) == 0) {
		    key = KEY_ENTER;
		} else {
		    fkey = FALSE;
		}
		break;
	    }
	}

	if (fkey) {
	    switch (key) {
	    default:
		if (key >= M_EVENT)
		    result = DLG_EXIT_OK;
		else
		    beep();
		break;
	    case KEY_ENTER:
		result = DLG_EXIT_OK;
		break;
	    case KEY_HOME:	/* First page */
		if (!obj.begin_reached) {
		    obj.begin_reached = 1;
		    /* First page not in buffer? */
		    fpos = ftell_obj(&obj);

		    if (fpos > obj.fd_bytes_read) {
			/* Yes, we have to read it in */
			lseek_obj(&obj, 0, SEEK_SET);

			read_high(&obj, BUF_SIZE);
		    }
		    obj.in_buf = 0;
		    moved = TRUE;
		}
		break;
	    case KEY_END:	/* Last page */
	    case KEY_LL:
		obj.end_reached = TRUE;
		/* Last page not in buffer? */
		fpos = ftell_obj(&obj);

		if (fpos < obj.file_size) {
		    /* Yes, we have to read it in */
		    lseek_obj(&obj, -BUF_SIZE, SEEK_END);

		    read_high(&obj, BUF_SIZE);
		}
		obj.in_buf = obj.bytes_read;
		back_lines(&obj, height - 4);
		moved = TRUE;
		break;
	    case KEY_UP:	/* Previous line */
		if (!obj.begin_reached) {
		    back_lines(&obj, obj.page_length + 1);
		    next = 1;
		    moved = TRUE;
		}
		break;
	    case KEY_PPAGE:	/* Previous page */
	    case M_EVENT + KEY_PPAGE:
		if (!obj.begin_reached) {
		    back_lines(&obj, obj.page_length + height - 4);
		    moved = TRUE;
		}
		break;
	    case KEY_DOWN:	/* Next line */
		if (!obj.end_reached) {
		    obj.begin_reached = 0;
		    next = -1;
		    moved = TRUE;
		}
		break;
	    case KEY_NPAGE:	/* Next page */
	    case M_EVENT + KEY_NPAGE:
		if (!obj.end_reached) {
		    obj.begin_reached = 0;
		    moved = TRUE;
		}
		break;
	    case KEY_BEG:	/* Beginning of line */
		if (obj.hscroll > 0) {
		    obj.hscroll = 0;
		    /* Reprint current page to scroll horizontally */
		    back_lines(&obj, obj.page_length);
		    moved = TRUE;
		}
		break;
	    case KEY_LEFT:	/* Scroll left */
		if (obj.hscroll > 0) {
		    obj.hscroll--;
		    /* Reprint current page to scroll horizontally */
		    back_lines(&obj, obj.page_length);
		    moved = TRUE;
		}
		break;
	    case KEY_RIGHT:	/* Scroll right */
		if (obj.hscroll < MAX_LEN) {
		    obj.hscroll++;
		    /* Reprint current page to scroll horizontally */
		    back_lines(&obj, obj.page_length);
		    moved = TRUE;
		}
		break;
	    }
	} else {
	    beep();
	}
    }

    dlg_del_window(dialog);
    free(obj.buf);
    (void) close(obj.fd);
    dlg_mouse_free_regions();
    return result;
}
