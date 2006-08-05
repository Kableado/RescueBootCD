# $Id: makefile.in,v 1.41 2005/03/06 16:54:14 tom Exp $
# template makefile for DIALOG
#
SHELL		= /bin/sh

srcdir		= .


prefix		= /usr/local
exec_prefix	= ${prefix}

top_builddir	= .

x		= 
o		= .o
a		= .a

DESTDIR		=
bindir		= $(DESTDIR)${exec_prefix}/bin
includedir	= $(DESTDIR)${prefix}/include
libdir		= $(DESTDIR)${exec_prefix}/lib
mandir		= $(DESTDIR)${prefix}/man
MAN1DIR		= $(mandir)/man1
MAN3DIR		= $(mandir)/man3

# see po/makefile
localedir       = $(prefix)/share/locale

CFLAGS		= -g -O2 -static
CPPFLAGS	=  -D_GNU_SOURCE -DHAVE_CONFIG_H -I. -I$(srcdir) -DLOCALEDIR=\"$(localedir)\"
EXTRA_CFLAGS	= 
CC		= gcc
AR		= ar
LDFLAGS		= -static
LIBS		= -lncurses  -lm -L/lib # 
RANLIB		= ranlib

RM		= rm -f
LINT		= lint

LIBTOOL		=  
LIBTOOL_CLEAN	= 
LIBTOOL_COMPILE	= 
LIBTOOL_CREATE	= $(AR) -cr
LIBTOOL_LINK	= 
LIBTOOL_INSTALL	= 
LIBTOOL_UNINSTALL = 

INSTALL		= /bin/install -c
INSTALL_PROGRAM	= $(LIBTOOL_INSTALL) ${INSTALL}
INSTALL_DATA	= ${INSTALL} -m 644

LINK		= $(LIBTOOL_LINK) $(CC)

#
# Standard .c to .o compile line.
#
.SUFFIXES: .c $o
.c$o :
# compiling
	$(LIBTOOL_COMPILE) $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(CPPFLAGS) -c $<

EXTRAOBJS =  rc$o calendar$o fselect$o timebox$o formbox$o guage$o tailbox$o
OBJECTS = $(EXTRAOBJS) \
	arrows$o \
	buttons$o \
	checklist$o \
	inputbox$o \
	inputstr$o \
	menubox$o \
	mouse$o \
	mousewget$o \
	msgbox$o \
	pause$o \
	textbox$o \
	ui_getc$o \
	util$o \
	version$o \
	yesno$o

LIB_OBJECT = $(OBJECTS)

SRCS = $(OBJECTS:$o=.c)
HDRS = \
	dialog.h \
	dlg_colors.h \
	dlg_config.h

LIB	= libdialog$a
PROG	= dialog$x
ALL	= $(LIB) $(PROG)

BIN_DIRS	= $(bindir) $(MAN1DIR)
LIB_DIRS	= $(libdir) $(includedir) $(MAN3DIR)

all	:: $(ALL)

#install	:: install-lib
#uninstall	:: uninstall-lib

# :
#	@echo "Building GNU gettext library..."
#	@cd intl && $(MAKE) 

dialog$o \
$(OBJECTS) : $(srcdir)/dialog.h dlg_config.h VERSION

$(LIB) : $(LIB_OBJECT)
	$(LIBTOOL_CREATE) $(LIB) $(LIB_OBJECT)
	$(RANLIB) $@

dialog$x : $(LIB) dialog$o # 
	$(LINK) -o $@ dialog$o -L. -ldialog $(LDFLAGS) $(LIBS)

clean	\
distclean \
install \
install-strip \
uninstall ::
	@echo making $@
#	@-test -f intl/makefile && cd intl && $(MAKE)  $@
#	@-test -f po/makefile && cd po && $(MAKE)  $@

clean	::
	@- $(RM) -r autom4te.cache
	- $(RM) *.*cov *.da *.bb *.bbg
	- $(LIBTOOL_CLEAN) $(RM) *$o $(ALL)
	- $(RM) headers.sed
	- $(RM) core *~ tags TAGS

distclean :: clean
	$(RM) intl/libintl.h intl/po2tbl.sed
	$(RM) makefile dlg_config.h config.cache config.log config.status
	$(RM) samples/install/makefile

install :: $(PROG) $(bindir)
	$(INSTALL_PROGRAM) $(PROG) $(bindir)

install-strip :: $(PROG) $(bindir)
	$(INSTALL_PROGRAM) -s $(PROG) $(bindir)

install-strip \
install :: $(MAN1DIR)
	$(INSTALL_DATA) $(srcdir)/dialog.1 $(MAN1DIR)

uninstall ::
	$(RM) $(bindir)/$(PROG)
	$(RM) $(MAN1DIR)/dialog.1

# most users do not want/need the library, so the install rules are distinct.
install-lib :: $(LIB_DIRS) headers.sed
	@ echo "** installing library in $(libdir)"
	$(LIBTOOL_INSTALL) $(INSTALL_DATA) $(LIB) $(libdir)
	@ echo "** installing headers in $(includedir)"
	@ $(SHELL) $(srcdir)/headers.sh $(INSTALL_DATA) $(includedir) $(srcdir) dialog.h
	@ $(SHELL) $(srcdir)/headers.sh $(INSTALL_DATA) $(includedir) $(srcdir) dlg_colors.h
	@ $(SHELL) $(srcdir)/headers.sh $(INSTALL_DATA) $(includedir) .         dlg_config.h
	@ echo "** installing manpage"
	$(INSTALL_DATA) $(srcdir)/dialog.3 $(MAN3DIR)

uninstall-lib :: $(LIB_DIRS)
	- $(LIBTOOL_UNINSTALL) $(RM) $(libdir)/$(LIB)
	$(RM) $(includedir)/dialog.h
	$(RM) $(includedir)/dlg_colors.h
	$(RM) $(includedir)/dlg_config.h
	$(RM) $(MAN3DIR)/dialog.3

headers.sed : $(srcdir)/headers.sh
	$(SHELL) $(srcdir)/headers.sh $(includedir) $(srcdir)

$(MAN1DIR) \
$(MAN3DIR) \
$(bindir) \
$(includedir) \
$(libdir) : ; $(srcdir)/mkdirs.sh $@

#tags :
#	ctags $(SRCS) $(HDRS)

#TAGS :
#	etags $(SRCS) $(HDRS)

lint:
	$(LINT) $(CPPFLAGS) *.c
