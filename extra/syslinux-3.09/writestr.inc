;; $Id: writestr.inc,v 1.5 2005/01/18 13:13:50 hpa Exp $
;; -----------------------------------------------------------------------
;;   
;;   Copyright 1994-2002 H. Peter Anvin - All Rights Reserved
;;
;;   This program is free software; you can redistribute it and/or modify
;;   it under the terms of the GNU General Public License as published by
;;   the Free Software Foundation, Inc., 53 Temple Place Ste 330,
;;   Boston MA 02111-1307, USA; either version 2 of the License, or
;;   (at your option) any later version; incorporated herein by reference.
;;
;; -----------------------------------------------------------------------

;;
;; writestr.inc
;;
;; Code to write a simple string.
;;

		section .text
;
; crlf: Print a newline
;
crlf:		push ax
		mov al,CR
		call writechr
		mov al,LF
		call writechr
		pop ax
		ret

;
; cwritestr: write a null-terminated string to the console, saving
;            registers on entry.
;
; Note: writestr and cwritestr are distinct in SYSLINUX (only)
;
cwritestr:
		pushfd
                pushad
.top:		lodsb
		and al,al
                jz .end
		call writechr
                jmp short .top
.end:		popad
		popfd
                ret
