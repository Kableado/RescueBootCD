;; $Id: loadhigh.inc,v 1.7 2005/01/06 22:34:06 hpa Exp $
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
;; loadhigh.inc
;; 
;; Load a file into high memory
;;

		section .text

;
; load_high:	loads (the remainder of) a file into high memory.
;		This routine prints dots for each 64K transferred, and
;		calls abort_check periodically.
; 
;		The xfer_buf_seg is used as a bounce buffer.
;
;		The input address (EDI) should be dword aligned, and the final
;		stretch is padded with zeroes if necessary.
;
; Inputs:	SI  = file handle/cluster pointer
;		EDI = target address in high memory
;		EAX = size of remaining file in bytes
;		DX   = zero-padding mask (e.g. 0003h for pad to dword)
;
; Outputs:	SI  = file handle/cluster pointer
;		EDI = first untouched address (not including padding)
;
load_high:
		push es

		mov bx,xfer_buf_seg
		mov es,bx

.read_loop:
		and si,si			; If SI == 0 then we have end of file
		jz .eof
		push si
		mov si,dot_msg
		call cwritestr
		pop si
		call abort_check

		push eax			; <A> Total bytes to transfer
		cmp eax,(1 << 16)		; Max 64K in one transfer
		jna .size_ok
		mov eax,(1 << 16)
.size_ok:
		push eax			; <B> Bytes transferred this chunk
		add eax,SECTOR_SIZE-1
		shr eax,SECTOR_SHIFT		; Convert to sectors

		; Now (e)ax contains the number of sectors to get
		push edi			; <C> Target buffer
		mov cx,ax
		xor bx,bx			; ES:0
		call getfssec			; Load the data into xfer_buf_seg
		pop edi				; <C> Target buffer
		pop ecx				; <B> Byte count this round
		push ecx			; <B> Byte count this round 
		push edi			; <C> Target buffer
.fix_slop:
		test cx,dx
		jz .noslop
		; The last dword fractional - pad with zeroes
		; Zero-padding is critical for multi-file initramfs.
		mov byte [es:ecx],0
		inc ecx
		jmp short .fix_slop
.noslop:
		push esi			; <D> File handle/cluster pointer
		mov esi,(xfer_buf_seg << 4)	; Source address
		call bcopy			; Copy to high memory
		pop esi				; <D> File handle/cluster pointer
		pop edi				; <C> Target buffer
		pop ecx				; <B> Byte count this round
		pop eax				; <A> Total bytes to transfer
		add edi,ecx
		sub eax,ecx
		jnz .read_loop			; More to read...
		
.eof:
		pop es
		ret

