;; $Id: bcopy32.inc,v 1.16 2005/01/06 22:34:06 hpa Exp $
;; -----------------------------------------------------------------------
;;   
;;   Copyright 1994-2005 H. Peter Anvin - All Rights Reserved
;;
;;   This program is free software; you can redistribute it and/or modify
;;   it under the terms of the GNU General Public License as published by
;;   the Free Software Foundation, Inc., 53 Temple Place Ste 330,
;;   Boston MA 02111-1307, USA; either version 2 of the License, or
;;   (at your option) any later version; incorporated herein by reference.
;;
;; -----------------------------------------------------------------------

;;
;; bcopy32.inc
;; 
;; 32-bit bcopy routine for real mode
;;

;
; 32-bit bcopy routine for real mode
;
; We enter protected mode, set up a flat 32-bit environment, run rep movsd
; and then exit.  IMPORTANT: This code assumes cs == 0.
;
; This code is probably excessively anal-retentive in its handling of
; segments, but this stuff is painful enough as it is without having to rely
; on everything happening "as it ought to."
;
; NOTE: this code is relocated into low memory, just after the .earlybss
; segment, in order to support to "bcopy over self" operation.
;

		section .bcopy32
		align 8
__bcopy_start:

		; This is in the .text segment since it needs to be
		; contiguous with the rest of the bcopy stuff

bcopy_gdt:	dw bcopy_gdt_size-1	; Null descriptor - contains GDT
		dd bcopy_gdt		; pointer for LGDT instruction
		dw 0
		dd 0000ffffh		; Code segment, use16, readable,
		dd 00009b00h		; present, dpl 0, cover 64K
		dd 0000ffffh		; Data segment, use16, read/write,
		dd 008f9300h		; present, dpl 0, cover all 4G
		dd 0000ffffh		; Data segment, use16, read/write,
		dd 00009300h		; present, dpl 0, cover 64K
		; The rest are used for COM32 only
		dd 0000ffffh		; Code segment, use32, readable,
		dd 00cf9b00h		; present, dpl 0, cover all 4G
		dd 0000ffffh		; Data segment, use32, read/write,
		dd 00cf9300h		; present, dpl 0, cover all 4G
bcopy_gdt_size:	equ $-bcopy_gdt

;
; bcopy:
;	32-bit copy, overlap safe
;
; Inputs:
;	ESI	- source pointer
;	EDI	- target pointer
;	ECX	- byte count
;	DF	- zero
;
; Outputs:
;	ESI	- first byte after source
;	EDI	- first byte after target
;	ECX	- zero
;
bcopy:		push eax
		push esi
		push edi
		push ecx
		pushf			; Saves, among others, the IF flag
		push ds
		push es

		cli
		call enable_a20

		o32 lgdt [cs:bcopy_gdt]
		mov eax,cr0
		or al,1
		mov cr0,eax		; Enter protected mode
		jmp 08h:.in_pm

.in_pm:		mov ax,10h		; Data segment selector
		mov es,ax
		mov ds,ax

		; Don't mess with ss, fs, and gs.  They are never changed
		; and should be able to make it back out of protected mode.
		; This works because (and only because) we don't take
		; interrupt in protected mode.

		cmp esi,edi		; If source > destination, we might
		ja .reverse		; have to copy backwards

.forward:
		mov al,cl		; Save low bits
		and al,3
		shr ecx,2		; Convert to dwords
		a32 rep movsd		; Do our business
		; At this point ecx == 0

		mov cl,al		; Copy any fractional dword
		a32 rep movsb
		jmp .exit

.reverse:
		std			; Reverse copy
		lea esi,[esi+ecx-1]	; Point to final byte
		lea edi,[edi+ecx-1]
		mov eax,ecx
		and ecx,3
		shr eax,2
		a32 rep movsb
		
		; Change ESI/EDI to point to the last dword, instead
		; of the last byte.
		sub esi,3
		sub edi,3
		mov ecx,eax
		a32 rep movsd

		cld

.exit:
		mov ax,18h		; "Real-mode-like" data segment
		mov es,ax
		mov ds,ax

		mov eax,cr0
		and al,~1
		mov cr0,eax		; Disable protected mode
		jmp 0:.in_rm

.in_rm:		; Back in real mode
		pop es
		pop ds
		call disable_a20

		popf			; Re-enables interrupts
		pop eax
		pop edi
		pop esi
		add edi,eax
		add esi,eax
		pop eax
		ret

;
; Routines to enable and disable (yuck) A20.  These routines are gathered
; from tips from a couple of sources, including the Linux kernel and
; http://www.x86.org/.  The need for the delay to be as large as given here
; is indicated by Donnie Barnes of RedHat, the problematic system being an
; IBM ThinkPad 760EL.
;
; We typically toggle A20 twice for every 64K transferred.
; 
%define	io_delay	call _io_delay
%define IO_DELAY_PORT	80h		; Invalid port (we hope!)
%define disable_wait 	32		; How long to wait for a disable

; Note the skip of 2 here
%define A20_DUNNO	0		; A20 type unknown
%define A20_NONE	2		; A20 always on?
%define A20_BIOS	4		; A20 BIOS enable
%define A20_KBC		6		; A20 through KBC
%define A20_FAST	8		; A20 through port 92h

slow_out:	out dx, al		; Fall through

_io_delay:	out IO_DELAY_PORT,al
		out IO_DELAY_PORT,al
		ret

enable_a20:
		pushad
		mov byte [cs:A20Tries],255 ; Times to try to make this work

try_enable_a20:
;
; Flush the caches
;
%if DO_WBINVD
		call try_wbinvd
%endif

;
; If the A20 type is known, jump straight to type
;
		mov bp,[cs:A20Type]
		jmp word [cs:bp+A20List]

;
; First, see if we are on a system with no A20 gate
;
a20_dunno:
a20_none:
		mov byte [cs:A20Type], A20_NONE
		call a20_test
		jnz a20_done

;
; Next, try the BIOS (INT 15h AX=2401h)
;
a20_bios:
		mov byte [cs:A20Type], A20_BIOS
		mov ax,2401h
		pushf				; Some BIOSes muck with IF
		int 15h
		popf

		call a20_test
		jnz a20_done

;
; Enable the keyboard controller A20 gate
;
a20_kbc:
		mov dl, 1			; Allow early exit
		call empty_8042
		jnz a20_done			; A20 live, no need to use KBC

		mov byte [cs:A20Type], A20_KBC	; Starting KBC command sequence

		mov al,0D1h			; Command write
		out 064h, al
		call empty_8042_uncond

		mov al,0DFh			; A20 on
		out 060h, al
		call empty_8042_uncond

		; Verify that A20 actually is enabled.  Do that by
		; observing a word in low memory and the same word in
		; the HMA until they are no longer coherent.  Note that
		; we don't do the same check in the disable case, because
		; we don't want to *require* A20 masking (SYSLINUX should
		; work fine without it, if the BIOS does.)
.kbc_wait:	push cx
		xor cx,cx
.kbc_wait_loop:
		call a20_test
		jnz a20_done_pop
		loop .kbc_wait_loop

		pop cx
;
; Running out of options here.  Final attempt: enable the "fast A20 gate"
;
a20_fast:
		mov byte [cs:A20Type], A20_FAST	; Haven't used the KBC yet
		in al, 092h
		or al,02h
		and al,~01h			; Don't accidentally reset the machine!
		out 092h, al

.fast_wait:	push cx
		xor cx,cx
.fast_wait_loop:
		call a20_test
		jnz a20_done_pop
		loop .fast_wait_loop

		pop cx

;
; Oh bugger.  A20 is not responding.  Try frobbing it again; eventually give up
; and report failure to the user.
;


		dec byte [cs:A20Tries]
		jnz try_enable_a20

		mov si, err_a20
		jmp abort_load
;
; A20 unmasked, proceed...
;
a20_done_pop:	pop cx
a20_done:	popad
		ret

;
; This routine tests if A20 is enabled (ZF = 0).  This routine
; must not destroy any register contents.
;
a20_test:
		push es
		push cx
		push ax
		mov cx,0FFFFh		; HMA = segment 0FFFFh
		mov es,cx
		mov cx,32		; Loop count
		mov ax,[cs:A20Test]
.a20_wait:	inc ax
		mov [cs:A20Test],ax
		io_delay		; Serialize, and fix delay
		cmp ax,[es:A20Test+10h]
		loopz .a20_wait
.a20_done:	pop ax
		pop cx
		pop es
		ret

disable_a20:
		pushad
;
; Flush the caches
;
%if DO_WBINVD
		call try_wbinvd
%endif

		mov bp,[cs:A20Type]
		jmp word [cs:bp+A20DList]

a20d_bios:
		mov ax,2400h
		pushf				; Some BIOSes muck with IF
		int 15h
		popf
		jmp short a20d_snooze

;
; Disable the "fast A20 gate"
;
a20d_fast:
		in al, 092h
		and al,~03h
		out 092h, al
		jmp short a20d_snooze

;
; Disable the keyboard controller A20 gate
;
a20d_kbc:
		call empty_8042_uncond
		mov al,0D1h
		out 064h, al		; Command write
		call empty_8042_uncond
		mov al,0DDh		; A20 off
		out 060h, al
		call empty_8042_uncond
		; Wait a bit for it to take effect
a20d_snooze:
		push cx
		mov cx, disable_wait
.delayloop:	call a20_test
		jz .disabled
		loop .delayloop
.disabled:	pop cx
a20d_dunno:
a20d_none:
		popad
		ret

;
; Routine to empty the 8042 KBC controller.  If dl != 0
; then we will test A20 in the loop and exit if A20 is
; suddenly enabled.
;
empty_8042_uncond:
		xor dl,dl
empty_8042:
		call a20_test
		jz .a20_on
		and dl,dl
		jnz .done
.a20_on:	io_delay
		in al, 064h		; Status port
		test al,1
		jz .no_output
		io_delay
		in al, 060h		; Read input
		jmp short empty_8042
.no_output:
		test al,2
		jnz empty_8042
		io_delay
.done:		ret	

;
; Execute a WBINVD instruction if possible on this CPU
;
%if DO_WBINVD
try_wbinvd:
		wbinvd
		ret
%endif

;
; bcopy_over_self:
;
; This routine is used to shuffle memory around, followed by
; invoking an entry point somewhere in low memory.  This routine
; can clobber any memory above 7C00h, we therefore have to move
; necessary code into the trackbuf area before doing the copy,
; and do adjustments to anything except BSS area references.
;
; NOTE: Since PXELINUX relocates itself, put all these
; references in the ".earlybss" segment.
;
; After performing the copy, this routine resets the stack and
; jumps to the specified entrypoint.
;
; IMPORTANT: This routine does not canonicalize the stack or the
; SS register.  That is the responsibility of the caller.
;
; Inputs:
; 	DS:BX		-> Pointer to list of (dst, src, len) pairs
; 	AX		-> Number of list entries
;	[CS:EntryPoint]	-> CS:IP to jump to
;	On stack	- initial state (fd, ad, ds, es, fs, gs)
;
shuffle_and_boot:
		and ax,ax
		jz .done
.loop:
		mov edi,[bx]
		mov esi,[bx+4]
		mov ecx,[bx+8]
		call bcopy
		add bx,12
		dec ax
		jnz .loop

.done:
		pop gs
		pop fs
		pop es
		pop ds
		popad
		popfd
		jmp far [cs:EntryPoint]

		align 2
A20List		dw a20_dunno, a20_none, a20_bios, a20_kbc, a20_fast
A20DList	dw a20d_dunno, a20d_none, a20d_bios, a20d_kbc, a20d_fast
a20_adjust_cnt	equ ($-A20List)/2

A20Type		dw A20_NONE		; A20 type

		; Total size of .bcopy32 section
		alignb 4, db 0		; Even number of dwords
__bcopy_size	equ $-__bcopy_start

		section .earlybss
		alignb 2
EntryPoint	resd 1			; CS:IP for shuffle_and_boot
SavedSSSP	resd 1			; Saved real mode SS:SP
A20Test		resw 1			; Counter for testing status of A20
A20Tries	resb 1			; Times until giving up on A20
