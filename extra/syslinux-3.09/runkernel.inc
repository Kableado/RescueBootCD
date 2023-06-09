;; $Id: runkernel.inc,v 1.21 2005/06/16 05:52:44 hpa Exp $
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
;; runkernel.inc
;; 
;; Common code for running a Linux kernel
;;

;
; Hook macros, that may or may not be defined
;
%ifndef HAVE_SPECIAL_APPEND
%macro SPECIAL_APPEND 0
%endmacro
%endif

%ifndef HAVE_UNLOAD_PREP
%macro UNLOAD_PREP 0
%endmacro
%endif

;
; A Linux kernel consists of three parts: boot sector, setup code, and
; kernel code.	The boot sector is never executed when using an external
; booting utility, but it contains some status bytes that are necessary.
;
; First check that our kernel is at least 1K and less than 8M (if it is
; more than 8M, we need to change the logic for loading it anyway...)
;
; We used to require the kernel to be 64K or larger, but it has gotten
; popular to use the Linux kernel format for other things, which may
; not be so large.
;
is_linux_kernel:
                cmp dx,80h			; 8 megs
		ja kernel_corrupt
		and dx,dx
		jnz kernel_sane
		cmp ax,1024			; Bootsect + 1 setup sect
		jb kernel_corrupt
kernel_sane:	push ax
		push dx
		push si
		mov si,loading_msg
                call cwritestr
;
; Now start transferring the kernel
;
		push word real_mode_seg
		pop es

		movzx eax,ax			; Fix this by using a 32-bit
		shl edx,16			; register for the kernel size
		or eax,edx
		mov [KernelSize],eax
		add eax,SECTOR_SIZE-1
		shr eax,SECTOR_SHIFT
                mov [KernelSects],eax		; Total sectors in kernel

;
; Now, if we transfer these straight, we'll hit 64K boundaries.	 Hence we
; have to see if we're loading more than 64K, and if so, load it step by
; step.
;

;
; Start by loading the bootsector/setup code, to see if we need to
; do something funky.  It should fit in the first 32K (loading 64K won't
; work since we might have funny stuff up near the end of memory).
; If we have larger than 32K clusters, yes, we're hosed.
;
		call abort_check		; Check for abort key
		mov ecx,8000h >> SECTOR_SHIFT	; Half a moby (32K)
		cmp ecx,[KernelSects]
		jna .normalkernel
		mov ecx,[KernelSects]
.normalkernel:
		sub [KernelSects],ecx
		xor bx,bx
                pop si                          ; Cluster pointer on stack
		call getfssec
                cmp word [es:bs_bootsign],0AA55h
		jne kernel_corrupt		; Boot sec signature missing

;
; Save the cluster pointer for later...
;
		push si
;
; Get the BIOS' idea of what the size of high memory is.
;
		call highmemsize
;
; Construct the command line (append options have already been copied)
;
construct_cmdline:
		mov di,[CmdLinePtr]
                mov si,boot_image        	; BOOT_IMAGE=
                mov cx,boot_image_len
                rep movsb
                mov si,KernelCName       	; Unmangled kernel name
                mov cx,[KernelCNameLen]
                rep movsb
                mov al,' '                      ; Space
                stosb

		SPECIAL_APPEND			; Module-specific hook

                mov si,[CmdOptPtr]              ; Options from user input
		call strcpy

;
; Scan through the command line for anything that looks like we might be
; interested in.  The original version of this code automatically assumed
; the first option was BOOT_IMAGE=, but that is no longer certain.
;
		mov si,cmd_line_here
		xor ax,ax
                mov [InitRDPtr],ax		; No initrd= option (yet)
                push es				; Set DS <- real_mode_seg
                pop ds
get_next_opt:   lodsb
		and al,al
		jz cmdline_end
		cmp al,' '
		jbe get_next_opt
		dec si
                mov eax,[si]
                cmp eax,'vga='
		je is_vga_cmd
                cmp eax,'mem='
		je is_mem_cmd
%if IS_PXELINUX
		cmp eax,'keep'			; Is it "keeppxe"?
		jne .notkeep
		cmp dword [si+3],'ppxe'
		jne .notkeep
		cmp byte [si+7],' '		; Must be whitespace or EOS
		ja .notkeep
		or byte [cs:KeepPXE],1
.notkeep:
%endif
                push es                         ; Save ES -> real_mode_seg
                push cs
                pop es                          ; Set ES <- normal DS
                mov di,initrd_cmd
		mov cx,initrd_cmd_len
		repe cmpsb
                jne .not_initrd

		cmp al,' '
		jbe .noramdisk
		mov [cs:InitRDPtr],si
		jmp .not_initrd
.noramdisk:
		xor ax,ax
		mov [cs:InitRDPtr],ax
.not_initrd:	pop es                          ; Restore ES -> real_mode_seg
skip_this_opt:  lodsb                           ; Load from command line
                cmp al,' '
                ja skip_this_opt
                dec si
                jmp short get_next_opt
is_vga_cmd:
                add si,4
                mov eax,[si-1]
                mov bx,-1
                cmp eax,'=nor'			; vga=normal
                je vc0
		dec bx				; bx <- -2
                cmp eax,'=ext'			; vga=ext
                je vc0
                dec bx				; bx <- -3
                cmp eax,'=ask'			; vga=ask
                je vc0
                call parseint                   ; vga=<number>
		jc skip_this_opt		; Not an integer
vc0:		mov [bs_vidmode],bx		; Set video mode
		jmp short skip_this_opt
is_mem_cmd:
                add si,4
                call parseint
		jc skip_this_opt		; Not an integer
%if HIGHMEM_SLOP != 0
		sub ebx,HIGHMEM_SLOP
%endif
		mov [cs:HighMemSize],ebx
		jmp short skip_this_opt
cmdline_end:
                push cs                         ; Restore standard DS
                pop ds
		sub si,cmd_line_here
		mov [CmdLineLen],si		; Length including final null
;
; Now check if we have a large kernel, which needs to be loaded high
;
		mov dword [RamdiskMax], HIGHMEM_MAX	; Default initrd limit
		cmp dword [es:su_header],HEADER_ID	; New setup code ID
		jne old_kernel		; Old kernel, load low
		cmp word [es:su_version],0200h	; Setup code version 2.0
		jb old_kernel		; Old kernel, load low
                cmp word [es:su_version],0201h	; Version 2.01+?
                jb new_kernel                   ; If 2.00, skip this step
                mov word [es:su_heapend],linux_stack	; Set up the heap
                or byte [es:su_loadflags],80h	; Let the kernel know we care
		cmp word [es:su_version],0203h	; Version 2.03+?
		jb new_kernel			; Not 2.03+
		mov eax,[es:su_ramdisk_max]
		mov [RamdiskMax],eax		; Set the ramdisk limit

;
; We definitely have a new-style kernel.  Let the kernel know who we are,
; and that we are clueful
;
new_kernel:
		mov byte [es:su_loader],my_id	; Show some ID
		movzx ax,byte [es:bs_setupsecs]	; Variable # of setup sectors
		mov [SetupSecs],ax
		xor eax,eax
		mov [es:su_ramdisklen],eax	; No initrd loaded yet

;
; About to load the kernel.  This is a modern kernel, so use the boot flags
; we were provided.
;
                mov al,[es:su_loadflags]
		mov [LoadFlags],al
;
; Load the kernel.  We always load it at 100000h even if we're supposed to
; load it "low"; for a "low" load we copy it down to low memory right before
; jumping to it.
;
read_kernel:
                mov si,KernelCName		; Print kernel name part of
                call cwritestr                  ; "Loading" message
                mov si,dotdot_msg		; Print dots
                call cwritestr

                mov eax,[HighMemSize]
		sub eax,100000h			; Load address
		cmp eax,[KernelSize]
		jb no_high_mem		; Not enough high memory
;
; Move the stuff beyond the setup code to high memory at 100000h
;
		movzx esi,word [SetupSecs]	; Setup sectors
		inc si				; plus 1 boot sector
                shl si,9			; Convert to bytes
                mov ecx,8000h			; 32K
		sub ecx,esi			; Number of bytes to copy
		push ecx
		add esi,(real_mode_seg << 4)	; Pointer to source
                mov edi,100000h                 ; Copy to address 100000h

                call bcopy			; Transfer to high memory

		; On exit EDI -> where to load the rest

                mov si,dot_msg			; Progress report
                call cwritestr
                call abort_check

		pop ecx				; Number of bytes in the initial portion
		pop si				; Restore file handle/cluster pointer
		mov eax,[KernelSize]
		sub eax,8000h			; Amount of kernel not yet loaded
		jbe high_load_done		; Zero left (tiny kernel)

		xor dx,dx			; No padding needed
		call load_high			; Copy the file

high_load_done:
		mov [KernelEnd],edi
                mov ax,real_mode_seg		; Set to real mode seg
                mov es,ax

                mov si,dot_msg
                call cwritestr

;
; Now see if we have an initial RAMdisk; if so, do requisite computation
; We know we have a new kernel; the old_kernel code already will have objected
; if we tried to load initrd using an old kernel
;
load_initrd:
                cmp word [InitRDPtr],0
                jz nk_noinitrd
		call parse_load_initrd
nk_noinitrd:
;
; Abandon hope, ye that enter here!  We do no longer permit aborts.
;
                call abort_check        	; Last chance!!

		mov si,ready_msg
		call cwritestr

		call vgaclearmode		; We can't trust ourselves after this

		UNLOAD_PREP			; Module-specific hook

;
; Now, if we were supposed to load "low", copy the kernel down to 10000h
; and the real mode stuff to 90000h.  We assume that all bzImage kernels are
; capable of starting their setup from a different address.
;
		mov ax,real_mode_seg
		mov fs,ax

;
; Copy command line.  Unfortunately, the kernel boot protocol requires
; the command line to exist in the 9xxxxh range even if the rest of the
; setup doesn't.
;
		cli				; In case of hooked interrupts
		test byte [LoadFlags],LOAD_HIGH
		jz need_high_cmdline
		cmp word [fs:su_version],0202h	; Support new cmdline protocol?
		jb need_high_cmdline
		; New cmdline protocol
		; Store 32-bit (flat) pointer to command line
		mov dword [fs:su_cmd_line_ptr],(real_mode_seg << 4) + cmd_line_here
		jmp short in_proper_place

need_high_cmdline:
;
; Copy command line up to 90000h
;
		mov ax,9000h			; Note AL <- 0
		mov es,ax
		mov si,cmd_line_here
		mov di,si
		mov [fs:kern_cmd_magic],word CMD_MAGIC ; Store magic
		mov [fs:kern_cmd_offset],di	; Store pointer

		mov cx,[CmdLineLen]
		cmp cx,255
		jna .len_ok
		mov cx,255			; Protocol < 0x202 has 255 as hard limit
.len_ok:
		fs rep movsb
		stosb				; Final null, note AL == 0 already

		push fs
		pop es

		test byte [LoadFlags],LOAD_HIGH
		jnz in_proper_place		; If high load, we're done

;
; Loading low; we can't assume it's safe to run in place.
;
; Copy real_mode stuff up to 90000h
;
		mov ax,9000h
		mov es,ax
		mov cx,[SetupSecs]
		inc cx				; Setup + boot sector
		shl cx,7			; Sectors -> dwords
		xor si,si
		xor di,di
		fs rep movsd			; Copy setup + boot sector
;
; Some kernels in the 1.2 ballpark but pre-bzImage have more than 4
; setup sectors, but the boot protocol had not yet been defined.  They
; rely on a signature to figure out if they need to copy stuff from
; the "protected mode" kernel area.  Unfortunately, we used that area
; as a transfer buffer, so it's going to find the signature there.
; Hence, zero the low 32K beyond the setup area.
;
		mov di,[SetupSecs]
		inc di				; Setup + boot sector
		mov cx,32768/512		; Sectors/32K
		sub cx,di			; Remaining sectors
		shl di,9			; Sectors -> bytes
		shl cx,7			; Sectors -> dwords
		xor eax,eax
		rep stosd			; Clear region
;
; Copy the kernel down to the "low" location
;
		mov ecx,[KernelSize]
		mov esi,100000h
		mov edi,10000h
		call bcopy

;
; Now everything is where it needs to be...
;
; When we get here, es points to the final segment, either
; 9000h or real_mode_seg
;
in_proper_place:

;
; If the default root device is set to FLOPPY (0000h), change to
; /dev/fd0 (0200h)
;
		cmp word [es:bs_rootdev],byte 0
		jne root_not_floppy
		mov word [es:bs_rootdev],0200h
root_not_floppy:

;
; Copy the disk table to high memory, then re-initialize the floppy
; controller
;
%if IS_SYSLINUX || IS_MDSLINUX
		lgs si,[cs:fdctab]
		mov di,linux_fdctab
		mov cx,6			; 12 bytes
		gs rep movsw
		mov [cs:fdctab],word linux_fdctab ; Save new floppy tab pos
		mov [cs:fdctab+2],es
%endif
;
; Linux wants the floppy motor shut off before starting the kernel,
; at least bootsect.S seems to imply so.
;
kill_motor:
		xor ax,ax
		xor dx,dx
		int 13h

;
; If we're debugging, wait for a keypress so we can read any debug messages
;
%ifdef debug
                xor ax,ax
                int 16h
%endif
;
; Set up segment registers and the Linux real-mode stack
; Note: es == the real mode segment
;
		cli
		mov bx,es
		mov ds,bx
		mov fs,bx
		mov gs,bx
		mov ss,bx
		mov sp,linux_stack
;
; We're done... now RUN THAT KERNEL!!!!
; Setup segment == real mode segment + 020h; we need to jump to offset
; zero in the real mode segment.
;
		add bx,020h
		push bx
		push word 0h
		retf

;
; Load an older kernel.  Older kernels always have 4 setup sectors, can't have
; initrd, and are always loaded low.
;
old_kernel:
               	cmp word [InitRDPtr],0		; Old kernel can't have initrd
                je load_old_kernel
                mov si,err_oldkernel
                jmp abort_load
load_old_kernel:
		mov word [SetupSecs],4		; Always 4 setup sectors
		mov byte [LoadFlags],0		; Always low
		jmp read_kernel

;
; parse_load_initrd
;
; Parse an initrd= option and load the initrds.  Note that we load
; from the high end of memory first, so we parse this option from
; left to right.
;
parse_load_initrd:
		push es
		push ds
		mov ax,real_mode_seg
		mov ds,ax
		push cs
		pop es			; DS == real_mode_seg, ES == CS

		mov si,[cs:InitRDPtr]
.find_end:
		lodsb
		cmp al,' '
		ja .find_end
		; Now SI points to one character beyond the
		; byte that ended this option.

.get_chunk:
		dec si

		; DS:SI points to a termination byte

		xor ax,ax
		xchg al,[si]		; Zero-terminate
		push si			; Save ending byte address
		push ax			; Save ending byte

.find_start:
		dec si
		cmp si,[cs:InitRDPtr]
		je .got_start
		cmp byte [si],','
		jne .find_start

		; It's a comma byte
		inc si

.got_start:
		push si
		mov di,InitRD		; Target buffer for mangled name
		call mangle_name
		call loadinitrd
		pop si

		pop ax
		pop di
		mov [di],al		; Restore ending byte

		cmp si,[cs:InitRDPtr]
		ja .get_chunk

		pop ds
		pop es
		ret

;
; Load RAM disk into high memory
;
; Input:	InitRD		- set to the mangled name of the initrd
;
loadinitrd:
		push ds
		push es
		mov ax,cs			; CS == DS == ES
		mov ds,ax
		mov es,ax
                mov si,InitRD
                mov di,InitRDCName
                call unmangle_name              ; Create human-readable name
                sub di,InitRDCName
                mov [InitRDCNameLen],di
                mov di,InitRD
                call searchdir                  ; Look for it in directory
		jz .notthere

		mov cx,dx
		shl ecx,16
		mov cx,ax			; ECX <- ram disk length

		mov ax,real_mode_seg
		mov es,ax

		push ecx			; Bytes to load
		cmp dword [es:su_ramdisklen],0
		je .nopadding			; Don't pad the last initrd
		add ecx,4095
		and cx,0F000h
.nopadding:
		add [es:su_ramdisklen],ecx
		mov edx,[HighMemSize]		; End of memory
		dec edx
		mov eax,[RamdiskMax]		; Highest address allowed by kernel
		cmp edx,eax
		jna .memsize_ok
		mov edx,eax			; Adjust to fit inside limit
.memsize_ok:
		inc edx
                and dx,0F000h			; Round down to 4K boundary
		sub edx,ecx			; Subtract size of ramdisk
                and dx,0F000h			; Round down to 4K boundary
		cmp edx,[KernelEnd]		; Are we hitting the kernel image?
		jb no_high_mem

                mov [es:su_ramdiskat],edx	; Load address
		mov [RamdiskMax],edx		; Next initrd loaded here

                mov edi,edx			; initrd load address
		push si
		mov si,crlfloading_msg		; Write "Loading "
		call cwritestr
                mov si,InitRDCName		; Write ramdisk name
                call cwritestr
                mov si,dotdot_msg		; Write dots
                call cwritestr
		pop si

		pop eax				; Bytes to load
		mov dx,0FFFh			; Pad to page
		call load_high			; Load the file

		pop es
		pop ds
		jmp crlf			; Print carriage return and return

.notthere:
                mov si,err_noinitrd
                call cwritestr
                mov si,InitRDCName
                call cwritestr
                mov si,crlf_msg
                jmp abort_load

no_high_mem:    				; Error routine
		mov si,err_nohighmem
                jmp abort_load

                ret

		section .data
boot_image      db 'BOOT_IMAGE='
boot_image_len  equ $-boot_image

		section .bss
		alignb 4
RamdiskMax	resd 1			; Highest address for ramdisk
KernelSize	resd 1			; Size of kernel in bytes
KernelSects	resd 1			; Size of kernel in sectors
KernelEnd	resd 1			; Ending address of the kernel image
CmdLineLen	resw 1			; Length of command line including null
SetupSecs	resw 1			; Number of setup sectors
InitRDPtr	resw 1			; Pointer to initrd= option in command line
LoadFlags	resb 1			; Loadflags from kernel
