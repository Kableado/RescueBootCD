	.file	"setup.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.ident	"$Id: setup.c,v 1.50 2005/04/29 06:04:45 hpa Exp $"
	.ident	"$Id: e820.h,v 1.4 2004/12/14 22:46:25 hpa Exp $"
	.ident	"$Id: conio.h,v 1.5 2004/12/14 22:46:25 hpa Exp $"
	.ident	"$Id: version.h,v 1.5 2005/01/03 08:31:59 hpa Exp $"
	.ident	"$Id: memdisk.h,v 1.9 2005/03/08 18:39:32 hpa Exp $"
.globl shdr
	.section	.rodata
	.align 4
	.type	shdr, @object
	.size	shdr, 4
shdr:
	.long	32768
.globl copyright
	.align 32
	.type	copyright, @object
	.size	copyright, 35
copyright:
	.string	"Copyright 2001-2005 H. Peter Anvin"
.globl memdisk_version
	.type	memdisk_version, @object
	.size	memdisk_version, 24
memdisk_version:
	.string	"MEMDISK 3.09 0x41effbca"
	.align 32
	.type	geometries, @object
	.size	geometries, 192
geometries:
	.long	720
	.long	40
	.long	2
	.long	9
	.long	0
	.byte	1
	.byte	0
	.zero	2
	.long	1440
	.long	80
	.long	2
	.long	9
	.long	0
	.byte	3
	.byte	0
	.zero	2
	.long	2400
	.long	80
	.long	2
	.long	15
	.long	0
	.byte	2
	.byte	0
	.zero	2
	.long	2880
	.long	80
	.long	2
	.long	18
	.long	0
	.byte	4
	.byte	0
	.zero	2
	.long	3360
	.long	80
	.long	2
	.long	21
	.long	0
	.byte	4
	.byte	0
	.zero	2
	.long	3444
	.long	82
	.long	2
	.long	21
	.long	0
	.byte	4
	.byte	0
	.zero	2
	.long	5760
	.long	80
	.long	2
	.long	36
	.long	0
	.byte	6
	.byte	0
	.zero	2
	.long	7680
	.long	80
	.long	2
	.long	48
	.long	0
	.byte	6
	.byte	0
	.zero	2
	.text
	.p2align 2,,3
.globl getcmditem
	.type	getcmditem, @function
getcmditem:
.LFB15:
	.file 1 "setup.c"
	.loc 1 185 0
	pushl	%edi
.LCFI0:
	pushl	%esi
.LCFI1:
	pushl	%ebx
.LCFI2:
	.loc 1 185 0
	movl	16(%esp), %edi
	.loc 1 188 0
	xorl	%eax, %eax
	.loc 1 190 0
	cmpb	$0, 32768
	.loc 1 187 0
	movl	%edi, %esi
	.loc 1 190 0
	movl	$32768, %ebx
	je	.L19
.L18:
	.loc 1 191 0
	cmpl	$1, %eax
	je	.L8
	jg	.L17
	testl	%eax, %eax
	je	.L6
	jmp	.L4
.L17:
	cmpl	$2, %eax
	je	.L15
	jmp	.L4
.L6:
	.loc 1 193 0
	cmpb	$32, (%ebx)
	je	.L4
	.loc 1 196 0
	movl	%edi, %esi
	.loc 1 197 0
	movl	$1, %eax
.L8:
	.loc 1 201 0
	movb	(%esi), %cl
	testb	%cl, %cl
	movb	(%ebx), %dl
	jne	.L9
	.loc 1 202 0
	cmpb	$61, %dl
	je	.L22
	.loc 1 204 0
	cmpb	$32, %dl
	je	.L23
	jmp	.L25
.L9:
	.loc 1 211 0
	incl	%esi
	cmpb	%cl, %dl
	je	.L4
.L25:
	.loc 1 212 0
	movl	$2, %eax
	.loc 1 213 0
	jmp	.L4
.L15:
	.loc 1 216 0
	cmpb	$32, (%ebx)
	jne	.L4
	.loc 1 217 0
	xorl	%eax, %eax
.L4:
	.loc 1 190 0
	incl	%ebx
	cmpb	$0, (%ebx)
	jne	.L18
	.loc 1 223 0
	decl	%eax
	jne	.L19
	cmpb	$0, (%esi)
	.loc 1 224 0
	movl	$-2, %eax
	.loc 1 223 0
	je	.L1
	jmp	.L19
.L22:
	.loc 1 203 0
	leal	1(%ebx), %eax
	jmp	.L1
.L23:
	.loc 1 205 0
	movl	$-2, %eax
	jmp	.L1
.L19:
	.loc 1 226 0
	orl	$-1, %eax
.L1:
	.loc 1 227 0
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
.LFE15:
	.size	getcmditem, .-getcmditem
	.p2align 2,,3
.globl die
	.type	die, @function
die:
.LFB18:
	.loc 1 494 0
	.loc 1 495 0
#APP
	sti
#NO_APP
.L27:
	.loc 1 497 0
#APP
	hlt
	.loc 1 496 0
#NO_APP
	jmp	.L27
.LFE18:
	.size	die, .-die
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"internal error: check_zip returned nonsense\n"
.LC1:
	.string	"Moving compressed data from 0x%08x to 0x%08x\n"
.LC2:
	.string	"Not enough memory to decompress image (need 0x%08x bytes)\n"
.LC3:
	.string	"gzip image: decompressed addr 0x%08x, len 0x%08x: "
	.text
	.p2align 2,,3
.globl unzip_if_needed
	.type	unzip_if_needed, @function
unzip_if_needed:
.LFB16:
	.loc 1 237 0
	pushl	%ebp
.LCFI3:
	pushl	%edi
.LCFI4:
	pushl	%esi
.LCFI5:
	pushl	%ebx
.LCFI6:
	subl	$32, %esp
.LCFI7:
	.loc 1 238 0
	movl	52(%esp), %eax
	movl	(%eax), %eax
	.loc 1 239 0
	movl	56(%esp), %edx
	.loc 1 238 0
	movl	%eax, 12(%esp)
	.loc 1 239 0
	movl	(%edx), %edx
	.loc 1 248 0
	leal	28(%esp), %eax
	.loc 1 239 0
	movl	%edx, 8(%esp)
	.loc 1 248 0
	pushl	%eax
.LCFI8:
	leal	28(%esp), %eax
	pushl	%eax
.LCFI9:
	leal	28(%esp), %eax
	pushl	%eax
.LCFI10:
	leal	28(%esp), %eax
	pushl	%eax
.LCFI11:
	pushl	%edx
.LCFI12:
	pushl	32(%esp)
.LCFI13:
	call	check_zip
	addl	$24, %esp
.LCFI14:
	testl	%eax, %eax
	jne	.L29
	.loc 1 251 0
	movl	16(%esp), %eax
	addl	28(%esp), %eax
	cmpl	8(%esp), %eax
	jbe	.L31
	.loc 1 254 0
	pushl	$.LC0
.LCFI15:
	call	puts
	jmp	.L52
.LCFI16:
.L31:
	.loc 1 261 0
	movl	nranges, %eax
	decl	%eax
	movl	%eax, (%esp)
	js	.L50
	imull	$12, %eax, %esi
.L47:
	.loc 1 266 0
	cmpl	$1, ranges+8(%esi)
	jne	.L34
	.loc 1 270 0
	movl	ranges+4(%esi), %edx
	cmpl	$0, %edx
	movl	ranges(%esi), %eax
	ja	.L34
	cmpl	$-2, %eax
	ja	.L34
	.loc 1 275 0
	movl	ranges+12(%esi), %eax
	addl	$-1, %eax
	movl	ranges+16(%esi), %edx
	adcl	$-1, %edx
	cmpl	$0, %edx
	ja	.L38
	cmpl	$-3, %eax
	ja	.L38
	movl	ranges+12(%esi), %ebp
	jmp	.L39
.L38:
	orl	$-1, %ebp
.L39:
	.loc 1 284 0
	movl	ranges(%esi), %edi
	addl	$511, %edi
	andl	$-512, %edi
	.loc 1 287 0
	cmpl	%ebp, %edi
	jae	.L34
	.loc 1 291 0
	movl	%ebp, %eax
	subl	%edi, %eax
	movl	20(%esp), %edx
	cmpl	%edx, %eax
	jb	.L34
	.loc 1 295 0
	movl	%ebp, %eax
	subl	%edx, %eax
	andl	$-512, %eax
	movl	%eax, 4(%esp)
	.loc 1 298 0
	movl	12(%esp), %ecx
	movl	8(%esp), %eax
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	addl	%eax, %ecx
	adcl	%edx, %ebx
	xorl	%edx, %edx
	cmpl	%edx, %ebx
	movl	4(%esp), %eax
	jb	.L44
	ja	.L45
	cmpl	%eax, %ecx
	jb	.L44
.L45:
	cmpl	%ebp, 12(%esp)
	jae	.L44
.LBB2:
	.loc 1 302 0
	movl	4(%esp), %eax
	subl	%edi, %eax
	cmpl	8(%esp), %eax
	jb	.L34
	.loc 1 305 0
	movl	4(%esp), %ebx
	subl	8(%esp), %ebx
	andl	$-512, %ebx
	.loc 1 306 0
	pushl	%ebx
.LCFI17:
	pushl	16(%esp)
.LCFI18:
	pushl	$.LC1
.LCFI19:
	call	printf
	.loc 1 311 0
	pushl	20(%esp)
.LCFI20:
	pushl	28(%esp)
.LCFI21:
	pushl	%ebx
.LCFI22:
.LCFI23:
	call	memcpy
	.loc 1 312 0
	movl	%ebx, 36(%esp)
.LBE2:
	addl	$24, %esp
.LCFI24:
	jmp	.L44
.L34:
	subl	$12, %esi
	.loc 1 261 0
	decl	(%esp)
	jns	.L47
.L50:
	.loc 1 321 0
	pushl	20(%esp)
.LCFI25:
	pushl	$.LC2
.LCFI26:
	call	printf
.L52:
	.loc 1 323 0
.LCFI27:
	call	die
.LCFI28:
.L44:
	.loc 1 315 0
	movl	4(%esp), %ebx
	.loc 1 326 0
	pushl	20(%esp)
.LCFI29:
	pushl	%ebx
.LCFI30:
	pushl	$.LC3
.LCFI31:
	call	printf
	.loc 1 329 0
	movl	32(%esp), %eax
	movl	68(%esp), %edx
	movl	%eax, (%edx)
	.loc 1 330 0
	pushl	%ebx
.LCFI32:
	pushl	40(%esp)
.LCFI33:
	pushl	%eax
.LCFI34:
	pushl	40(%esp)
.LCFI35:
	movl	56(%esp), %eax
	addl	%eax, 40(%esp)
	pushl	40(%esp)
.LCFI36:
.LCFI37:
	call	unzip
	movl	84(%esp), %edx
	movl	%eax, (%edx)
	addl	$32, %esp
.LCFI38:
.L29:
	.loc 1 333 0
	addl	$32, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.LFE16:
	.size	unzip_if_needed, .-unzip_if_needed
	.data
	.align 4
	.type	hd_geometry.0, @object
	.size	hd_geometry.0, 24
hd_geometry.0:
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.byte	0
	.byte	-128
	.zero	2
	.section	.rodata.str1.1
.LC4:
	.string	"command line: %s\n"
.LC5:
	.string	"offset"
.LC6:
	.string	"DOSEMU"
.LC7:
	.string	"c"
.LC8:
	.string	"h"
.LC9:
	.string	"s"
.LC10:
	.string	"floppy"
.LC11:
	.string	"harddisk"
.LC12:
	.string	"MEMDISK: Image has fractional end sector\n"
.LC13:
	.string	"MEMDISK: Image seems to have fractional end cylinder\n"
.LC14:
	.string	"MEMDISK: Image appears to be truncated\n"
	.text
	.p2align 2,,3
.globl get_disk_image_geometry
	.type	get_disk_image_geometry, @function
get_disk_image_geometry:
.LFB17:
	.loc 1 382 0
	pushl	%ebp
.LCFI39:
	pushl	%edi
.LCFI40:
	pushl	%esi
.LCFI41:
	pushl	%ebx
.LCFI42:
	subl	$204, %esp
.LCFI43:
	.loc 1 393 0
	pushl	$32768
.LCFI44:
	pushl	$.LC4
.LCFI45:
	call	printf
	.loc 1 396 0
	pushl	$.LC5
.LCFI46:
.LCFI47:
	call	getcmditem
	.loc 1 395 0
	xorl	%esi, %esi
	.loc 1 396 0
	addl	$12, %esp
.LCFI48:
	testl	%eax, %eax
	js	.L54
	pushl	%eax
.LCFI49:
	call	atou
	testl	%eax, %eax
	popl	%ebp
.LCFI50:
	je	.L54
	.loc 1 397 0
	movl	%eax, %esi
.L54:
	.loc 1 399 0
	movl	228(%esp), %ebp
	subl	%esi, %ebp
	shrl	$9, %ebp
	.loc 1 400 0
	xorl	%edi, %edi
	movl	$geometries, %edx
	xorl	%eax, %eax
.L59:
	.loc 1 401 0
	cmpl	(%edx), %ebp
	je	.L98
	.loc 1 400 0
	incl	%edi
	addl	$24, %eax
	addl	$24, %edx
	cmpl	$7, %edi
	jbe	.L59
.L56:
	.loc 1 411 0
	movl	224(%esp), %eax
	leal	12(%esp), %ebx
	addl	%esi, %eax
	pushl	$128
.LCFI51:
	pushl	%eax
.LCFI52:
	pushl	%ebx
.LCFI53:
	.loc 1 408 0
	movl	%esi, hd_geometry.0+16
	.loc 1 407 0
	movl	%ebp, hd_geometry.0
.LBB3:
.LBB4:
	.file 2 "memdisk.h"
	.loc 2 54 0
	movl	$.LC6, %esi
.LBE4:
.LBE3:
	.loc 1 411 0
	call	memcpy
	.loc 2 53 0
	addl	$12, %esp
.LCFI54:
.LBB5:
.LBB6:
	.loc 2 55 0
	movl	%ebx, %ecx
.L65:
	.loc 2 59 0
	movzbl	(%ecx), %edx
	movzbl	(%esi), %eax
	incl	%ecx
	incl	%esi
	.loc 2 60 0
	cmpl	%eax, %edx
	je	.L65
.LBE6:
.LBE5:
	.loc 1 423 0
	pushl	$.LC7
.LCFI55:
	call	getcmditem
	testl	%eax, %eax
	popl	%edi
.LCFI56:
	js	.L66
	pushl	%eax
.LCFI57:
	call	atou
	testl	%eax, %eax
	popl	%esi
.LCFI58:
	je	.L66
	.loc 1 424 0
	movl	%eax, hd_geometry.0+4
.L66:
	.loc 1 425 0
	pushl	$.LC8
.LCFI59:
	call	getcmditem
	testl	%eax, %eax
	popl	%ebx
.LCFI60:
	js	.L67
	pushl	%eax
.LCFI61:
	call	atou
	testl	%eax, %eax
	popl	%ecx
.LCFI62:
	je	.L67
	.loc 1 426 0
	movl	%eax, hd_geometry.0+8
.L67:
	.loc 1 427 0
	pushl	$.LC9
.LCFI63:
	call	getcmditem
	testl	%eax, %eax
	popl	%edx
.LCFI64:
	js	.L68
	pushl	%eax
.LCFI65:
	call	atou
	testl	%eax, %eax
	popl	%edi
.LCFI66:
	je	.L68
	.loc 1 428 0
	movl	%eax, hd_geometry.0+12
.L68:
	.loc 1 430 0
	pushl	$.LC10
.LCFI67:
	call	getcmditem
	incl	%eax
	popl	%esi
.LCFI68:
	je	.L69
	.loc 1 432 0
	cmpb	$0, hd_geometry.0+20
	.loc 1 431 0
	movb	$0, hd_geometry.0+21
	.loc 1 432 0
	jne	.L71
	.loc 1 433 0
	movb	$16, hd_geometry.0+20
	.loc 1 434 0
	jmp	.L71
.L98:
	.loc 1 402 0
	pushl	$24
.LCFI69:
	addl	$geometries, %eax
	pushl	%eax
.LCFI70:
	pushl	$hd_geometry.0
.LCFI71:
	call	memcpy
	.loc 1 403 0
	addl	$12, %esp
.LCFI72:
	jmp	.L56
.L69:
	.loc 1 435 0
	pushl	$.LC11
.LCFI73:
	call	getcmditem
	incl	%eax
	popl	%ebx
.LCFI74:
	je	.L71
	.loc 1 436 0
	movb	$-128, hd_geometry.0+21
	.loc 1 437 0
	movb	$0, hd_geometry.0+20
.L71:
	.loc 1 441 0
	cmpl	$0, hd_geometry.0+4
	je	.L74
	cmpl	$0, hd_geometry.0+8
	je	.L74
	cmpl	$0, hd_geometry.0+12
	jne	.L73
.L74:
	.loc 1 444 0
	movl	hd_geometry.0+16, %eax
	addl	%eax, 224(%esp)
	movl	224(%esp), %eax
	leal	140(%esp), %ebx
	addl	$446, %eax
	pushl	$64
.LCFI75:
	pushl	%eax
.LCFI76:
	pushl	%ebx
.LCFI77:
	call	memcpy
	.loc 1 446 0
	xorl	%esi, %esi
	movl	$0, 20(%esp)
	movl	$1, 16(%esp)
	movl	$3, %edi
	.loc 1 447 0
	addl	$12, %esp
.LCFI78:
.L85:
	.loc 1 448 0
	cmpb	$0, 4(%ebx)
	je	.L77
	.loc 1 449 0
	movb	2(%ebx), %dl
	movb	%dl, %al
	shrb	$6, %al
	movzbl	3(%ebx), %ecx
	movzbl	%al, %eax
	leal	(%ecx,%eax), %eax
	.loc 1 450 0
	andl	$63, %edx
	.loc 1 453 0
	cmpl	%eax, 8(%esp)
	.loc 1 451 0
	movzbl	1(%ebx), %ecx
	.loc 1 453 0
	jae	.L79
	movl	%eax, 8(%esp)
.L79:
	.loc 1 454 0
	cmpl	%ecx, %esi
	jae	.L80
	movl	%ecx, %esi
.L80:
	.loc 1 455 0
	cmpl	%edx, 4(%esp)
	jae	.L81
	movl	%edx, 4(%esp)
.L81:
	.loc 1 457 0
	movb	6(%ebx), %dl
	movb	%dl, %al
	shrb	$6, %al
	movzbl	7(%ebx), %ecx
	movzbl	%al, %eax
	leal	(%ecx,%eax), %eax
	.loc 1 458 0
	andl	$63, %edx
	.loc 1 461 0
	cmpl	%eax, 8(%esp)
	.loc 1 459 0
	movzbl	5(%ebx), %ecx
	.loc 1 461 0
	jae	.L82
	movl	%eax, 8(%esp)
.L82:
	.loc 1 462 0
	cmpl	%ecx, %esi
	jae	.L83
	movl	%ecx, %esi
.L83:
	.loc 1 463 0
	cmpl	%edx, 4(%esp)
	jae	.L77
	movl	%edx, 4(%esp)
.L77:
	addl	$16, %ebx
	decl	%edi
	jns	.L85
	.loc 1 467 0
	incl	%esi
	.loc 1 469 0
	cmpl	$0, hd_geometry.0+8
	jne	.L86
	.loc 1 470 0
	movl	%esi, hd_geometry.0+8
.L86:
	.loc 1 471 0
	cmpl	$0, hd_geometry.0+12
	jne	.L87
	.loc 1 472 0
	movl	4(%esp), %ecx
	movl	%ecx, hd_geometry.0+12
.L87:
	.loc 1 473 0
	cmpl	$0, hd_geometry.0+4
	jne	.L73
	.loc 1 474 0
	movl	hd_geometry.0+12, %eax
	movl	%eax, %edx
	imull	hd_geometry.0+8, %edx
	movl	%edx, %ebx
	movl	%ebp, %eax
	xorl	%edx, %edx
	divl	%ebx
	movl	%eax, hd_geometry.0+4
.L73:
	.loc 1 477 0
	movl	hd_geometry.0+16, %eax
	subl	%eax, 228(%esp)
	testl	$511, 228(%esp)
	je	.L89
	.loc 1 478 0
	pushl	$.LC12
.LCFI79:
	call	puts
	popl	%ecx
.LCFI80:
.L89:
	.loc 1 480 0
	movl	hd_geometry.0+12, %eax
	movl	%eax, %edx
	imull	hd_geometry.0+8, %edx
	movl	%edx, %ecx
	movl	%ebp, %eax
	xorl	%edx, %edx
	divl	%ecx
	testl	%edx, %edx
	je	.L90
	.loc 1 481 0
	pushl	$.LC13
.LCFI81:
	call	puts
	popl	%edx
.LCFI82:
.L90:
	.loc 1 483 0
	movl	hd_geometry.0+8, %eax
	imull	hd_geometry.0+4, %eax
	imull	hd_geometry.0+12, %eax
	cmpl	%ebp, %eax
	jbe	.L91
	.loc 1 484 0
	pushl	$.LC14
.LCFI83:
	call	puts
	popl	%eax
.LCFI84:
.L91:
	.loc 1 488 0
	addl	$204, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	movl	$hd_geometry.0, %eax
	popl	%ebp
	ret
.LFE17:
	.size	get_disk_image_geometry, .-get_disk_image_geometry
	.section	.rodata.str1.1
.LC15:
	.string	"%s  %s\n"
.LC16:
	.string	"MEMDISK: No ramdisk image specified!\n"
.LC17:
	.string	"Ramdisk at 0x%08x, length 0x%08x\n"
.LC18:
	.string	"hard disk"
.LC19:
	.string	"Disk is %s, %u K, C/H/S = %u/%u/%u\n"
.LC20:
	.string	"ro"
.LC21:
	.string	"Marking disk readonly\n"
.LC22:
	.string	"raw"
.LC23:
	.string	"Using raw access to high memory\n"
.LC24:
	.string	"bigraw"
.LC25:
	.string	"Using raw access to high memory - assuming big real mode\n"
.LC26:
	.string	"Total size needed = %u bytes, allocating %uK\n"
.LC27:
	.string	"MEMDISK: Insufficient low memory\n"
.LC28:
	.string	"Old dos memory at 0x%05x (map says 0x%05x), loading at 0x%05x\n"
.LC29:
	.string	"1588: 0x%04x  15E801: 0x%04x 0x%04x\n"
.LC30:
	.string	"INT 13 08: Failure, assuming this is the only drive"
.LC31:
	.string	"INT 13 08: Success, count = %u, BPT = %04x:%04x\n"
.LC32:
	.string	"old: int13 = %08x  int15 = %08x\n"
.LC33:
	.string	"new: int13 = %08x  int15 = %08x\n"
.LC34:
	.string	"Loading boot sector... "
.LC35:
	.string	"MEMDISK: Failed to load new boot sector\n"
.LC36:
	.string	"pause"
.LC37:
	.string	"press any key to boot... "
.LC38:
	.string	"booting...\n"
	.text
	.p2align 2,,3
.globl setup
	.type	setup, @function
setup:
.LFB19:
	.loc 1 511 0
	pushl	%ebp
.LCFI85:
	pushl	%edi
.LCFI86:
	pushl	%esi
.LCFI87:
	pushl	%ebx
.LCFI88:
	subl	$88, %esp
.LCFI89:
	.loc 1 525 0
	movl	108(%esp), %eax
	movl	%eax, syscall
	.loc 1 526 0
	movl	112(%esp), %eax
	.loc 1 529 0
	pushl	$copyright
.LCFI90:
	pushl	$memdisk_version
.LCFI91:
	pushl	$.LC15
.LCFI92:
	.loc 1 526 0
	movl	%eax, sys_bounce
	.loc 1 529 0
	call	printf
	.loc 1 531 0
	movl	33304, %eax
	addl	$12, %esp
.LCFI93:
	testl	%eax, %eax
	je	.L101
	cmpl	$0, 33308
	jne	.L100
.L101:
	.loc 1 532 0
	pushl	$.LC16
.LCFI94:
	jmp	.L150
.LCFI95:
.L100:
	.loc 1 536 0
	movl	%eax, 32(%esp)
	.loc 1 537 0
	movl	33308, %eax
	movl	%eax, 36(%esp)
	.loc 1 539 0
	call	e820map_init
	.loc 1 540 0
	call	get_mem
	.loc 1 541 0
	call	parse_mem
	.loc 1 543 0
	pushl	36(%esp)
.LCFI96:
	pushl	36(%esp)
.LCFI97:
	pushl	$.LC17
.LCFI98:
	call	printf
	.loc 1 546 0
	leal	48(%esp), %eax
	pushl	%eax
.LCFI99:
	leal	48(%esp), %eax
	pushl	%eax
.LCFI100:
.LCFI101:
	call	unzip_if_needed
	.loc 1 548 0
	pushl	56(%esp)
.LCFI102:
	pushl	56(%esp)
.LCFI103:
.LCFI104:
	call	get_disk_image_geometry
	.loc 1 550 0
	pushl	12(%eax)
.LCFI105:
	pushl	8(%eax)
.LCFI106:
	pushl	4(%eax)
.LCFI107:
	.loc 1 548 0
	movl	%eax, %ebp
	.loc 1 550 0
	movl	(%eax), %eax
	shrl	%eax
	pushl	%eax
.LCFI108:
	cmpb	$0, 21(%ebp)
	movl	$.LC18, %eax
	jne	.L103
	movl	$.LC10, %eax
.L103:
	pushl	%eax
.LCFI109:
	pushl	$.LC19
.LCFI110:
.LCFI111:
	call	printf
	.loc 1 556 0
	addl	$52, %esp
.LCFI112:
	pushl	$2
.LCFI113:
	xorl	%edx, %edx
	movl	40(%esp), %eax
	pushl	%edx
.LCFI114:
	pushl	%eax
.LCFI115:
	xorl	%edx, %edx
	movl	44(%esp), %eax
	pushl	%edx
.LCFI116:
	pushl	%eax
.LCFI117:
	call	insertrange
	.loc 1 557 0
.LCFI118:
	call	parse_mem
	.loc 1 561 0
	movzwl	_binary_memdisk_bin_start+4, %edx
.LBB7:
.LBB8:
	.loc 1 155 0
	movzwl	1043, %eax
.LBE8:
.LBE7:
	.loc 1 561 0
	leal	_binary_memdisk_bin_start(%edx), %esi
	.loc 1 154 0
	addl	$20, %esp
.LCFI119:
	.loc 1 564 0
	movw	%ax, 20(%esi)
	.loc 1 565 0
	sall	$10, %eax
	movl	%eax, 8(%esp)
	.loc 1 567 0
	movl	dos_mem, %eax
	cmpl	%eax, 8(%esp)
	jbe	.L105
	.loc 1 568 0
	movl	%eax, 8(%esp)
.L105:
	.loc 1 570 0
	movb	21(%ebp), %al
	movb	%al, 44(%esi)
	.loc 1 571 0
	movb	20(%ebp), %al
	movb	%al, 45(%esi)
	.loc 1 572 0
	movl	4(%ebp), %eax
	movw	%ax, 28(%esi)
	.loc 1 573 0
	movl	8(%ebp), %eax
	movw	%ax, 30(%esi)
	.loc 1 574 0
	movl	12(%ebp), %eax
	movl	%eax, 32(%esi)
	.loc 1 575 0
	movl	(%ebp), %eax
	movl	%eax, 4(%esi)
	.loc 1 576 0
	movl	16(%ebp), %eax
	addl	32(%esp), %eax
	movl	%eax, _binary_memdisk_bin_start(%edx)
	.loc 1 577 0
	cmpb	$0, 21(%ebp)
	movl	$1140, %eax
	js	.L107
	movb	$65, %al
.L107:
	movw	%ax, 50(%esi)
	.loc 1 579 0
	movb	33296, %al
	movb	%al, 22(%esi)
	.loc 1 581 0
	movb	$0, 47(%esi)
	.loc 1 583 0
	pushl	$.LC20
.LCFI120:
	call	getcmditem
	incl	%eax
	popl	%ebx
.LCFI121:
	je	.L108
	.loc 1 584 0
	pushl	$.LC21
.LCFI122:
	call	puts
	.loc 1 585 0
	orb	$1, 47(%esi)
	popl	%ecx
.LCFI123:
.L108:
	.loc 1 587 0
	pushl	$.LC22
.LCFI124:
	call	getcmditem
	incl	%eax
	popl	%edx
.LCFI125:
	je	.L109
	.loc 1 588 0
	pushl	$.LC23
.LCFI126:
	call	puts
	.loc 1 589 0
	orb	$2, 47(%esi)
	popl	%eax
.LCFI127:
.L109:
	.loc 1 591 0
	pushl	$.LC24
.LCFI128:
	call	getcmditem
	incl	%eax
	popl	%edi
.LCFI129:
	je	.L110
	.loc 1 592 0
	pushl	$.LC25
.LCFI130:
	call	puts
	.loc 1 593 0
	orb	$10, 47(%esi)
	popl	%ebx
.LCFI131:
.L110:
	.loc 1 597 0
	cmpb	$0, 21(%ebp)
	jns	.L111
	.loc 1 599 0
	movw	4(%ebp), %ax
	decl	%eax
	movw	%ax, 52(%esi)
	.loc 1 600 0
	movb	8(%ebp), %al
	decl	%eax
	movb	%al, 54(%esi)
	.loc 1 601 0
	movl	8(%ebp), %eax
	cmpl	$9, %eax
	sbbl	%eax, %eax
	notl	%eax
	andl	$8, %eax
	movb	%al, 60(%esi)
	jmp	.L114
.L111:
	.loc 1 605 0
	movb	$-33, 52(%esi)
	.loc 1 606 0
	movb	$2, 53(%esi)
	.loc 1 607 0
	movb	$37, 54(%esi)
	.loc 1 608 0
	movl	12(%ebp), %eax
	movb	%al, 55(%esi)
	.loc 1 609 0
	movb	$2, 56(%esi)
	.loc 1 610 0
	movb	$18, 57(%esi)
	.loc 1 611 0
	movb	$-1, 58(%esi)
	.loc 1 612 0
	movb	$108, 59(%esi)
	.loc 1 613 0
	movb	$-10, 60(%esi)
	.loc 1 614 0
	movb	$15, 61(%esi)
	.loc 1 615 0
	movb	$5, 62(%esi)
	.loc 1 159 0
	movl	120, %eax
	movl	%eax, 64(%esi)
.L114:
	.loc 1 624 0
	xorl	%eax, %eax
	cld
	orl	$-1, %ecx
	movl	$32768, %edi
	repnz
	scasb
	movl	%ecx, 4(%esp)
	notl	4(%esp)
	.loc 1 626 0
	imull	$12, nranges, %eax
	.loc 1 625 0
	movzwl	_binary_memdisk_bin_start+6, %ebx
	.loc 1 626 0
	leal	36(%ebx,%eax), %ebx
	.loc 1 628 0
	movl	4(%esp), %eax
	leal	512(%ebx,%eax), %ebx
	.loc 1 629 0
	leal	1023(%ebx), %eax
	sarl	$10, %eax
	pushl	%eax
.LCFI132:
	pushl	%ebx
.LCFI133:
	pushl	$.LC26
.LCFI134:
	call	printf
	.loc 1 632 0
	movl	dos_mem, %eax
	addl	$12, %esp
.LCFI135:
	cmpl	%eax, %ebx
	jbe	.L116
	.loc 1 633 0
	pushl	$.LC27
.LCFI136:
	jmp	.L150
.LCFI137:
.L116:
	.loc 1 637 0
	movl	8(%esp), %edx
	subl	%ebx, %edx
	movl	%edx, %ebx
	.loc 1 638 0
	andl	$-1024, %ebx
	.loc 1 640 0
	pushl	%ebx
.LCFI138:
	pushl	%eax
.LCFI139:
	pushl	16(%esp)
.LCFI140:
	pushl	$.LC28
.LCFI141:
	call	printf
.LBB9:
	.loc 1 139 0
	movl	%ebx, %eax
.LBE9:
	addl	$16, %esp
.LCFI142:
.LBB10:
	shrl	$10, %eax
.LBB11:
	.loc 1 140 0
	movw	%ax, 1043
.LBE11:
.LBE10:
	.loc 1 645 0
	xorl	%edx, %edx
	pushl	$2
.LCFI143:
	movl	dos_mem, %eax
	pushl	%edx
.LCFI144:
	subl	%ebx, %eax
	pushl	%eax
.LCFI145:
	xorl	%edx, %edx
	pushl	%edx
.LCFI146:
	pushl	%ebx
.LCFI147:
	call	insertrange
	.loc 1 646 0
.LCFI148:
	call	parse_mem
	.loc 1 648 0
	movl	low_mem, %edx
	.loc 1 649 0
	movl	high_mem, %ecx
	.loc 1 648 0
	movl	%edx, %edi
	.loc 1 649 0
	movl	%ecx, %eax
	.loc 1 648 0
	shrl	$10, %edi
	.loc 1 649 0
	shrl	$16, %eax
	.loc 1 650 0
	addl	$20, %esp
.LCFI149:
	cmpl	$15728640, %edx
	.loc 1 648 0
	movl	%edi, 36(%esi)
	.loc 1 649 0
	movl	%eax, 40(%esi)
	.loc 1 650 0
	jne	.L118
.LBB12:
	.loc 1 652 0
	shrl	$10, %ecx
	.loc 1 653 0
	leal	15360(%ecx), %eax
	cmpl	$65535, %eax
	jbe	.L119
	movl	$65535, %eax
.L119:
	movw	%ax, 26(%esi)
.LBE12:
	jmp	.L120
.L118:
	.loc 1 655 0
	movw	%di, 26(%esi)
.L120:
	.loc 1 658 0
	pushl	40(%esi)
.LCFI150:
	pushl	36(%esi)
.LCFI151:
	movzwl	26(%esi), %eax
	pushl	%eax
.LCFI152:
	pushl	$.LC29
.LCFI153:
	call	printf
	.loc 1 661 0
	movl	%ebx, %eax
	shrl	$4, %eax
	movl	%eax, 32(%esp)
	.loc 1 665 0
	movl	24(%esp), %eax
	.loc 1 662 0
	movzwl	32(%esp), %edx
	.loc 1 665 0
	subw	%bx, %ax
	.loc 1 662 0
	movl	%edx, 16(%esp)
	.loc 1 665 0
	movw	%ax, 48(%esi)
	.loc 1 662 0
	sall	$16, %edx
	.loc 1 159 0
	movl	76, %eax
	.loc 1 662 0
	movl	%edx, 28(%esp)
	.loc 1 159 0
	movl	%eax, 12(%esi)
	.loc 1 675 0
	movl	nranges, %edx
	.loc 1 159 0
	addl	$16, %esp
.LCFI154:
	movl	84, %eax
	.loc 1 675 0
	testl	%edx, %edx
	.loc 1 159 0
	movl	%eax, 16(%esi)
	.loc 1 675 0
	je	.L124
	imull	$12, %edx, %eax
	cmpl	$0, ranges-4(%eax)
	jne	.L124
	subl	$12, %eax
.L125:
	movl	%edx, %ecx
	decl	%ecx
	movl	$-1, ranges+8(%eax)
	je	.L149
	subl	$12, %eax
	cmpl	$0, ranges+8(%eax)
	movl	%ecx, %edx
	je	.L125
.L149:
	movl	%ecx, nranges
.L124:
	.loc 1 679 0
	leal	40(%esp), %edi
	xorl	%eax, %eax
	cld
	movl	$11, %ecx
	rep
	stosl
	.loc 1 680 0
	movw	$0, 44(%esp)
	.loc 1 681 0
	movb	$8, 77(%esp)
	.loc 1 682 0
	movb	21(%ebp), %al
	movb	%al, 68(%esp)
	.loc 1 683 0
	leal	40(%esp), %eax
	pushl	%eax
.LCFI155:
	pushl	%eax
.LCFI156:
	pushl	$19
.LCFI157:
	call	*syscall
	.loc 1 685 0
	addl	$12, %esp
.LCFI158:
	testb	$1, 80(%esp)
	je	.L126
	.loc 1 686 0
	pushl	$.LC30
.LCFI159:
	call	puts
	.loc 1 687 0
	movb	$1, 46(%esi)
	popl	%ecx
.LCFI160:
	jmp	.L127
.L126:
	.loc 1 689 0
	movzwl	48(%esp), %eax
	pushl	%eax
.LCFI161:
	movzwl	48(%esp), %eax
	pushl	%eax
.LCFI162:
	movzbl	76(%esp), %eax
	pushl	%eax
.LCFI163:
	pushl	$.LC31
.LCFI164:
	call	printf
	.loc 1 691 0
	movb	84(%esp), %al
	incl	%eax
	movb	%al, 46(%esi)
	addl	$16, %esp
.LCFI165:
.L127:
	.loc 1 695 0
	imull	$12, nranges, %edx
	movl	$_binary_memdisk_bin_size, %eax
	addl	%edx, %eax
	addl	$12, %eax
	movw	%ax, 8(%esi)
	.loc 1 696 0
	movl	16(%esp), %eax
	movw	%ax, 10(%esi)
.LBB13:
	.loc 1 700 0
	movl	(%esp), %esi
.LBB14:
.LBB15:
	.loc 2 46 0
	pushl	$_binary_memdisk_bin_size
.LCFI166:
.LBE15:
.LBE14:
	.loc 1 700 0
	sall	$4, %esi
.LBB16:
.LBB17:
	.loc 2 46 0
	pushl	$_binary_memdisk_bin_start
.LCFI167:
	pushl	%esi
.LCFI168:
	call	memcpy
.LBE17:
.LBE16:
.LBB18:
	.loc 2 45 0
	imull	$12, nranges, %ebx
.LBE18:
.LBB19:
.LBB20:
	.loc 2 46 0
	addl	$12, %esp
.LCFI169:
.LBE20:
.LBE19:
.LBB21:
	.loc 2 45 0
	addl	$12, %ebx
.LBB22:
	.loc 2 46 0
	pushl	%ebx
.LCFI170:
.LBE22:
.LBE21:
.LBB23:
.LBB24:
	addl	$_binary_memdisk_bin_size, %esi
.LBE24:
.LBE23:
.LBB25:
.LBB26:
	pushl	$ranges
.LCFI171:
	pushl	%esi
.LCFI172:
	call	memcpy
	addl	$12, %esp
.LCFI173:
.LBE26:
.LBE25:
.LBB27:
	.loc 2 45 0
	movl	4(%esp), %eax
	incl	%eax
.LBB28:
	.loc 2 46 0
	pushl	%eax
.LCFI174:
	pushl	$32768
.LCFI175:
.LBE28:
.LBE27:
.LBB29:
.LBB30:
	addl	%ebx, %esi
.LBE30:
.LBE29:
.LBB31:
.LBB32:
	pushl	%esi
.LCFI176:
	call	memcpy
	addl	$12, %esp
.LCFI177:
.LBE32:
.LBE31:
.LBE13:
	.loc 1 159 0
	pushl	84
.LCFI178:
	pushl	76
.LCFI179:
	pushl	$.LC32
.LCFI180:
	call	printf
	.loc 1 144 0
	addl	$12, %esp
.LCFI181:
.LBB33:
	movzwl	_binary_memdisk_bin_start, %edx
.LBE33:
.LBB34:
	movzwl	_binary_memdisk_bin_start+2, %eax
.LBE34:
.LBB35:
	addl	12(%esp), %edx
.LBE35:
.LBB36:
	addl	12(%esp), %eax
.LBE36:
.LBB37:
.LBB38:
	.loc 1 145 0
	movl	%edx, 76
.LBE38:
.LBE37:
.LBB39:
.LBB40:
	movl	%eax, 84
.LBE40:
.LBE39:
	.loc 1 159 0
	pushl	%eax
.LCFI182:
	pushl	%edx
.LCFI183:
	pushl	$.LC33
.LCFI184:
	call	printf
	.loc 1 718 0
	addl	$12, %esp
.LCFI185:
	cmpb	$0, 21(%ebp)
	jns	.L137
.LBB41:
.LBB42:
	.loc 1 135 0
	incb	1141
.LBE42:
.LBE41:
	jmp	.L140
.L137:
.LBB43:
	.loc 1 149 0
	movb	1040, %al
	.loc 1 724 0
	movzbl	%al, %edx
	testb	$1, %dl
	je	.L142
	.loc 1 725 0
	andl	$192, %edx
	cmpl	$192, %edx
	je	.L144
	.loc 1 726 0
	addl	$64, %eax
	jmp	.L144
.L142:
	.loc 1 729 0
	orl	$1, %eax
	.loc 1 730 0
	andl	$63, %eax
.L144:
.LBB44:
.LBB45:
	.loc 1 135 0
	movb	%al, 1040
.L140:
.LBE45:
.LBE44:
.LBE43:
	.loc 1 736 0
	pushl	$.LC34
.LCFI186:
	call	puts
	.loc 1 738 0
	leal	44(%esp), %edi
	xorl	%eax, %eax
	cld
	movl	$11, %ecx
	rep
	stosl
	.loc 1 740 0
	movw	$513, 80(%esp)
	.loc 1 741 0
	movw	$31744, 68(%esp)
	.loc 1 742 0
	movw	$1, 76(%esp)
	.loc 1 743 0
	movzbw	21(%ebp), %ax
	.loc 1 744 0
	leal	44(%esp), %ebx
	.loc 1 743 0
	movw	%ax, 72(%esp)
	.loc 1 744 0
	pushl	%ebx
.LCFI187:
	pushl	%ebx
.LCFI188:
	pushl	$19
.LCFI189:
.LCFI190:
	call	*syscall
	.loc 1 746 0
	addl	$16, %esp
.LCFI191:
	testb	$1, 80(%esp)
	je	.L146
	.loc 1 747 0
	pushl	$.LC35
.LCFI192:
.L150:
	call	puts
	.loc 1 748 0
.LCFI193:
	call	die
.LCFI194:
.L146:
	.loc 1 751 0
	pushl	$.LC36
.LCFI195:
	call	getcmditem
	incl	%eax
	popl	%edx
.LCFI196:
	je	.L147
	.loc 1 752 0
	pushl	$.LC37
.LCFI197:
	call	puts
	.loc 1 753 0
	movw	$0, 80(%esp)
	.loc 1 754 0
	pushl	$0
.LCFI198:
	pushl	%ebx
.LCFI199:
	pushl	$22
.LCFI200:
.LCFI201:
	call	*syscall
	addl	$16, %esp
.LCFI202:
.L147:
	.loc 1 757 0
	pushl	$.LC38
.LCFI203:
	call	puts
	.loc 1 760 0
	movzbl	21(%ebp), %eax
	.loc 1 761 0
	addl	$92, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.LCFI204:
.LFE19:
	.size	setup, .-setup
	.comm	syscall,4,4
	.comm	sys_bounce,4,4
	.section	.debug_frame,"",@progbits
.Lframe0:
	.long	.LECIE0-.LSCIE0
.LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -4
	.byte	0x8
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x1
	.align 4
.LECIE0:
.LSFDE0:
	.long	.LEFDE0-.LASFDE0
.LASFDE0:
	.long	.Lframe0
	.long	.LFB15
	.long	.LFE15-.LFB15
	.byte	0x4
	.long	.LCFI0-.LFB15
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.align 4
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB18
	.long	.LFE18-.LFB18
	.align 4
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB16
	.long	.LFE16-.LFB16
	.byte	0x4
	.long	.LCFI3-.LFB16
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x34
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x38
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x3c
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x40
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x44
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x48
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x4c
	.byte	0x2e
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x34
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x38
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x34
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x38
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x3c
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x40
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x44
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x48
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x4c
	.byte	0x2e
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI23-.LCFI22
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x34
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x38
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x3c
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI27-.LCFI26
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x34
	.byte	0x4
	.long	.LCFI29-.LCFI28
	.byte	0xe
	.uleb128 0x38
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0x3c
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x40
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI32-.LCFI31
	.byte	0xe
	.uleb128 0x44
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x48
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x4c
	.byte	0x2e
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI35-.LCFI34
	.byte	0xe
	.uleb128 0x50
	.byte	0x2e
	.uleb128 0x1c
	.byte	0x4
	.long	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x54
	.byte	0x2e
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI37-.LCFI36
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0x34
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB17
	.long	.LFE17-.LFB17
	.byte	0x4
	.long	.LCFI39-.LFB17
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0xe0
	.byte	0x4
	.long	.LCFI44-.LCFI43
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0xe8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0xec
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI47-.LCFI46
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI50-.LCFI49
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI51-.LCFI50
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI52-.LCFI51
	.byte	0xe
	.uleb128 0xe8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI53-.LCFI52
	.byte	0xe
	.uleb128 0xec
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI55-.LCFI54
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI58-.LCFI57
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI59-.LCFI58
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI60-.LCFI59
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI61-.LCFI60
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI62-.LCFI61
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI63-.LCFI62
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI64-.LCFI63
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI65-.LCFI64
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI66-.LCFI65
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI67-.LCFI66
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI68-.LCFI67
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI69-.LCFI68
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI70-.LCFI69
	.byte	0xe
	.uleb128 0xe8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI71-.LCFI70
	.byte	0xe
	.uleb128 0xec
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI72-.LCFI71
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI73-.LCFI72
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI74-.LCFI73
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI75-.LCFI74
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI76-.LCFI75
	.byte	0xe
	.uleb128 0xe8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI77-.LCFI76
	.byte	0xe
	.uleb128 0xec
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI78-.LCFI77
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI79-.LCFI78
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI80-.LCFI79
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI81-.LCFI80
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI82-.LCFI81
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI83-.LCFI82
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI84-.LCFI83
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB19
	.long	.LFE19-.LFB19
	.byte	0x4
	.long	.LCFI85-.LFB19
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI86-.LCFI85
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI87-.LCFI86
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI88-.LCFI87
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI89-.LCFI88
	.byte	0xe
	.uleb128 0x6c
	.byte	0x4
	.long	.LCFI90-.LCFI89
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI91-.LCFI90
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI92-.LCFI91
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI93-.LCFI92
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI94-.LCFI93
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI95-.LCFI94
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI96-.LCFI95
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI97-.LCFI96
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI98-.LCFI97
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI99-.LCFI98
	.byte	0xe
	.uleb128 0x7c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI100-.LCFI99
	.byte	0xe
	.uleb128 0x80
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI101-.LCFI100
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI102-.LCFI101
	.byte	0xe
	.uleb128 0x84
	.byte	0x2e
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI103-.LCFI102
	.byte	0xe
	.uleb128 0x88
	.byte	0x2e
	.uleb128 0x1c
	.byte	0x4
	.long	.LCFI104-.LCFI103
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI105-.LCFI104
	.byte	0xe
	.uleb128 0x8c
	.byte	0x2e
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI106-.LCFI105
	.byte	0xe
	.uleb128 0x90
	.byte	0x2e
	.uleb128 0x24
	.byte	0x4
	.long	.LCFI107-.LCFI106
	.byte	0xe
	.uleb128 0x94
	.byte	0x2e
	.uleb128 0x28
	.byte	0x4
	.long	.LCFI108-.LCFI107
	.byte	0xe
	.uleb128 0x98
	.byte	0x2e
	.uleb128 0x2c
	.byte	0x4
	.long	.LCFI109-.LCFI108
	.byte	0xe
	.uleb128 0x9c
	.byte	0x2e
	.uleb128 0x30
	.byte	0x4
	.long	.LCFI110-.LCFI109
	.byte	0xe
	.uleb128 0xa0
	.byte	0x2e
	.uleb128 0x34
	.byte	0x4
	.long	.LCFI111-.LCFI110
	.byte	0x2e
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI112-.LCFI111
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI113-.LCFI112
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI114-.LCFI113
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI115-.LCFI114
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI116-.LCFI115
	.byte	0xe
	.uleb128 0x7c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI117-.LCFI116
	.byte	0xe
	.uleb128 0x80
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI118-.LCFI117
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI119-.LCFI118
	.byte	0xe
	.uleb128 0x6c
	.byte	0x4
	.long	.LCFI120-.LCFI119
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI121-.LCFI120
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI122-.LCFI121
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI123-.LCFI122
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI124-.LCFI123
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI125-.LCFI124
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI126-.LCFI125
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI127-.LCFI126
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI128-.LCFI127
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI129-.LCFI128
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI130-.LCFI129
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI131-.LCFI130
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI132-.LCFI131
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI133-.LCFI132
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI134-.LCFI133
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI135-.LCFI134
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI136-.LCFI135
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI137-.LCFI136
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI138-.LCFI137
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI139-.LCFI138
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI140-.LCFI139
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI141-.LCFI140
	.byte	0xe
	.uleb128 0x7c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI142-.LCFI141
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI143-.LCFI142
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI144-.LCFI143
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI145-.LCFI144
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI146-.LCFI145
	.byte	0xe
	.uleb128 0x7c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI147-.LCFI146
	.byte	0xe
	.uleb128 0x80
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI148-.LCFI147
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI149-.LCFI148
	.byte	0xe
	.uleb128 0x6c
	.byte	0x4
	.long	.LCFI150-.LCFI149
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI151-.LCFI150
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI152-.LCFI151
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI153-.LCFI152
	.byte	0xe
	.uleb128 0x7c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI154-.LCFI153
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI155-.LCFI154
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI156-.LCFI155
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI157-.LCFI156
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI158-.LCFI157
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI159-.LCFI158
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI160-.LCFI159
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI161-.LCFI160
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI162-.LCFI161
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI163-.LCFI162
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI164-.LCFI163
	.byte	0xe
	.uleb128 0x7c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI165-.LCFI164
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI166-.LCFI165
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI167-.LCFI166
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI168-.LCFI167
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI169-.LCFI168
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI170-.LCFI169
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI171-.LCFI170
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI172-.LCFI171
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI173-.LCFI172
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI174-.LCFI173
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI175-.LCFI174
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI176-.LCFI175
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI177-.LCFI176
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI178-.LCFI177
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI179-.LCFI178
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI180-.LCFI179
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI181-.LCFI180
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI182-.LCFI181
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI183-.LCFI182
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI184-.LCFI183
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI185-.LCFI184
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI186-.LCFI185
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI187-.LCFI186
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI188-.LCFI187
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI189-.LCFI188
	.byte	0xe
	.uleb128 0x7c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI190-.LCFI189
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI191-.LCFI190
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI192-.LCFI191
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI193-.LCFI192
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI194-.LCFI193
	.byte	0xe
	.uleb128 0x6c
	.byte	0x4
	.long	.LCFI195-.LCFI194
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI196-.LCFI195
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI197-.LCFI196
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI198-.LCFI197
	.byte	0xe
	.uleb128 0x74
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI199-.LCFI198
	.byte	0xe
	.uleb128 0x78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI200-.LCFI199
	.byte	0xe
	.uleb128 0x7c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI201-.LCFI200
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI202-.LCFI201
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI203-.LCFI202
	.byte	0xe
	.uleb128 0x70
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI204-.LCFI203
	.byte	0xe
	.uleb128 0x6c
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE8:
	.file 3 "../com32/include/stdint.h"
	.file 4 "../com32/include/com32.h"
	.file 5 "e820.h"
	.text
.Letext0:
	.section	.debug_info
	.long	0x1053
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.Ldebug_line0
	.long	.Letext0
	.long	.Ltext0
	.long	.LASF174
	.byte	0x1
	.long	.LASF175
	.long	.LASF176
	.uleb128 0x2
	.long	.LASF0
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.long	.LASF1
	.byte	0x2
	.byte	0x5
	.uleb128 0x3
	.string	"int"
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.long	.LASF2
	.byte	0x8
	.byte	0x5
	.uleb128 0x4
	.long	.LASF4
	.byte	0x3
	.byte	0xf
	.long	0x4c
	.uleb128 0x2
	.long	.LASF3
	.byte	0x1
	.byte	0x8
	.uleb128 0x4
	.long	.LASF5
	.byte	0x3
	.byte	0x10
	.long	0x5e
	.uleb128 0x2
	.long	.LASF6
	.byte	0x2
	.byte	0x7
	.uleb128 0x4
	.long	.LASF7
	.byte	0x3
	.byte	0x11
	.long	0x70
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x7
	.uleb128 0x4
	.long	.LASF9
	.byte	0x3
	.byte	0x12
	.long	0x82
	.uleb128 0x2
	.long	.LASF10
	.byte	0x8
	.byte	0x7
	.uleb128 0x5
	.long	0xb2
	.long	.LASF18
	.byte	0xc
	.byte	0x5
	.byte	0x16
	.uleb128 0x6
	.long	.LASF11
	.byte	0x5
	.byte	0x17
	.long	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.long	.LASF12
	.byte	0x5
	.byte	0x18
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.long	.LASF13
	.byte	0x1
	.byte	0x6
	.uleb128 0x7
	.long	0xdd
	.byte	0x4
	.byte	0x4
	.byte	0x1f
	.uleb128 0x8
	.string	"l"
	.byte	0x4
	.byte	0x1c
	.long	0x65
	.uleb128 0x8
	.string	"w"
	.byte	0x4
	.byte	0x1d
	.long	0xdd
	.uleb128 0x8
	.string	"b"
	.byte	0x4
	.byte	0x1e
	.long	0xf4
	.byte	0x0
	.uleb128 0x9
	.long	0xed
	.long	0x53
	.uleb128 0xa
	.long	0xed
	.byte	0x1
	.byte	0x0
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x7
	.uleb128 0x9
	.long	0x104
	.long	0x41
	.uleb128 0xa
	.long	0xed
	.byte	0x3
	.byte	0x0
	.uleb128 0x4
	.long	.LASF14
	.byte	0x4
	.byte	0x1f
	.long	0xb9
	.uleb128 0xb
	.long	0x1ca
	.byte	0x2c
	.byte	0x4
	.byte	0x31
	.uleb128 0xc
	.string	"gs"
	.byte	0x4
	.byte	0x22
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.string	"fs"
	.byte	0x4
	.byte	0x23
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xc
	.string	"es"
	.byte	0x4
	.byte	0x24
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.string	"ds"
	.byte	0x4
	.byte	0x25
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xc
	.string	"edi"
	.byte	0x4
	.byte	0x27
	.long	0x104
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xc
	.string	"esi"
	.byte	0x4
	.byte	0x28
	.long	0x104
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xc
	.string	"ebp"
	.byte	0x4
	.byte	0x29
	.long	0x104
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.long	.LASF15
	.byte	0x4
	.byte	0x2a
	.long	0x104
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xc
	.string	"ebx"
	.byte	0x4
	.byte	0x2b
	.long	0x104
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xc
	.string	"edx"
	.byte	0x4
	.byte	0x2c
	.long	0x104
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xc
	.string	"ecx"
	.byte	0x4
	.byte	0x2d
	.long	0x104
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xc
	.string	"eax"
	.byte	0x4
	.byte	0x2e
	.long	0x104
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.long	.LASF16
	.byte	0x4
	.byte	0x30
	.long	0x104
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x4
	.long	.LASF17
	.byte	0x4
	.byte	0x31
	.long	0x10f
	.uleb128 0x5
	.long	0x236
	.long	.LASF19
	.byte	0x18
	.byte	0x4
	.byte	0x46
	.uleb128 0x6
	.long	.LASF20
	.byte	0x4
	.byte	0x47
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.long	.LASF21
	.byte	0x4
	.byte	0x48
	.long	0x236
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF22
	.byte	0x4
	.byte	0x49
	.long	0x263
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF23
	.byte	0x4
	.byte	0x4a
	.long	0x269
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.long	.LASF24
	.byte	0x4
	.byte	0x4b
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.long	.LASF25
	.byte	0x4
	.byte	0x4c
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0xb2
	.uleb128 0xe
	.long	0x252
	.byte	0x1
	.uleb128 0xf
	.long	0x41
	.uleb128 0xf
	.long	0x252
	.uleb128 0xf
	.long	0x25d
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x258
	.uleb128 0x10
	.long	0x1ca
	.uleb128 0xd
	.byte	0x4
	.long	0x1ca
	.uleb128 0xd
	.byte	0x4
	.long	0x23c
	.uleb128 0x11
	.byte	0x4
	.uleb128 0xe
	.long	0x281
	.byte	0x1
	.uleb128 0xf
	.long	0x65
	.uleb128 0xf
	.long	0x252
	.uleb128 0xf
	.long	0x25d
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x26b
	.uleb128 0x4
	.long	.LASF26
	.byte	0x2
	.byte	0x1d
	.long	0x292
	.uleb128 0xd
	.byte	0x4
	.long	0x298
	.uleb128 0xe
	.long	0x2ae
	.byte	0x1
	.uleb128 0xf
	.long	0x41
	.uleb128 0xf
	.long	0x25d
	.uleb128 0xf
	.long	0x25d
	.byte	0x0
	.uleb128 0x5
	.long	0x2f3
	.long	.LASF27
	.byte	0x8
	.byte	0x1
	.byte	0x1c
	.uleb128 0x6
	.long	.LASF28
	.byte	0x1
	.byte	0x1d
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.long	.LASF29
	.byte	0x1
	.byte	0x1e
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.long	.LASF30
	.byte	0x1
	.byte	0x1f
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF31
	.byte	0x1
	.byte	0x20
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0x0
	.uleb128 0x5
	.long	0x346
	.long	.LASF32
	.byte	0x10
	.byte	0x1
	.byte	0x25
	.uleb128 0x6
	.long	.LASF33
	.byte	0x1
	.byte	0x26
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.long	.LASF34
	.byte	0x1
	.byte	0x27
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.long	.LASF35
	.byte	0x1
	.byte	0x28
	.long	0x346
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x6
	.long	.LASF36
	.byte	0x1
	.byte	0x29
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF37
	.byte	0x1
	.byte	0x2a
	.long	0x356
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x9
	.long	0x356
	.long	0x41
	.uleb128 0xa
	.long	0xed
	.byte	0x4
	.byte	0x0
	.uleb128 0x9
	.long	0x366
	.long	0x41
	.uleb128 0xa
	.long	0xed
	.byte	0x6
	.byte	0x0
	.uleb128 0x5
	.long	0x429
	.long	.LASF38
	.byte	0x10
	.byte	0x1
	.byte	0x2c
	.uleb128 0x6
	.long	.LASF39
	.byte	0x1
	.byte	0x2d
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.long	.LASF40
	.byte	0x1
	.byte	0x2e
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x6
	.long	.LASF41
	.byte	0x1
	.byte	0x2f
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.long	.LASF42
	.byte	0x1
	.byte	0x30
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xc
	.string	"bps"
	.byte	0x1
	.byte	0x32
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF43
	.byte	0x1
	.byte	0x33
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.long	.LASF44
	.byte	0x1
	.byte	0x34
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x6
	.long	.LASF45
	.byte	0x1
	.byte	0x35
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x6
	.long	.LASF46
	.byte	0x1
	.byte	0x37
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF47
	.byte	0x1
	.byte	0x38
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x6
	.long	.LASF48
	.byte	0x1
	.byte	0x39
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x6
	.long	.LASF49
	.byte	0x1
	.byte	0x3a
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0x6
	.long	.LASF50
	.byte	0x1
	.byte	0x3c
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x7
	.long	0x446
	.byte	0x10
	.byte	0x1
	.byte	0x3e
	.uleb128 0x8
	.string	"hd"
	.byte	0x1
	.byte	0x2b
	.long	0x2f3
	.uleb128 0x8
	.string	"fd"
	.byte	0x1
	.byte	0x3d
	.long	0x366
	.byte	0x0
	.uleb128 0x4
	.long	.LASF51
	.byte	0x1
	.byte	0x3e
	.long	0x429
	.uleb128 0x5
	.long	0x592
	.long	.LASF52
	.byte	0x44
	.byte	0x1
	.byte	0x40
	.uleb128 0x6
	.long	.LASF53
	.byte	0x1
	.byte	0x41
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.long	.LASF54
	.byte	0x1
	.byte	0x42
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF55
	.byte	0x1
	.byte	0x43
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF56
	.byte	0x1
	.byte	0x43
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x6
	.long	.LASF57
	.byte	0x1
	.byte	0x45
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.long	.LASF58
	.byte	0x1
	.byte	0x46
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.long	.LASF59
	.byte	0x1
	.byte	0x48
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.long	.LASF60
	.byte	0x1
	.byte	0x49
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x6
	.long	.LASF61
	.byte	0x1
	.byte	0x4b
	.long	0x592
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0x6
	.long	.LASF62
	.byte	0x1
	.byte	0x4c
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x6
	.long	.LASF63
	.byte	0x1
	.byte	0x4e
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.long	.LASF64
	.byte	0x1
	.byte	0x4f
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0x6
	.long	.LASF42
	.byte	0x1
	.byte	0x50
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF65
	.byte	0x1
	.byte	0x52
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.long	.LASF66
	.byte	0x1
	.byte	0x53
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.long	.LASF67
	.byte	0x1
	.byte	0x55
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x6
	.long	.LASF68
	.byte	0x1
	.byte	0x56
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2d
	.uleb128 0x6
	.long	.LASF69
	.byte	0x1
	.byte	0x57
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x6
	.long	.LASF70
	.byte	0x1
	.byte	0x58
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2f
	.uleb128 0x6
	.long	.LASF71
	.byte	0x1
	.byte	0x5d
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x6
	.long	.LASF72
	.byte	0x1
	.byte	0x5e
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x32
	.uleb128 0xc
	.string	"dpt"
	.byte	0x1
	.byte	0x60
	.long	0x446
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x9
	.long	0x5a2
	.long	0x41
	.uleb128 0xa
	.long	0xed
	.byte	0x2
	.byte	0x0
	.uleb128 0x12
	.long	0x717
	.long	.LASF73
	.value	0x230
	.byte	0x1
	.byte	0x64
	.uleb128 0x6
	.long	.LASF74
	.byte	0x1
	.byte	0x65
	.long	0x717
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.long	.LASF75
	.byte	0x1
	.byte	0x66
	.long	0x41
	.byte	0x3
	.byte	0x23
	.uleb128 0x1f1
	.uleb128 0x6
	.long	.LASF76
	.byte	0x1
	.byte	0x67
	.long	0x53
	.byte	0x3
	.byte	0x23
	.uleb128 0x1f2
	.uleb128 0x6
	.long	.LASF77
	.byte	0x1
	.byte	0x68
	.long	0x53
	.byte	0x3
	.byte	0x23
	.uleb128 0x1f4
	.uleb128 0x6
	.long	.LASF78
	.byte	0x1
	.byte	0x69
	.long	0x53
	.byte	0x3
	.byte	0x23
	.uleb128 0x1f6
	.uleb128 0x6
	.long	.LASF79
	.byte	0x1
	.byte	0x6a
	.long	0x53
	.byte	0x3
	.byte	0x23
	.uleb128 0x1f8
	.uleb128 0x6
	.long	.LASF80
	.byte	0x1
	.byte	0x6b
	.long	0x53
	.byte	0x3
	.byte	0x23
	.uleb128 0x1fa
	.uleb128 0x6
	.long	.LASF81
	.byte	0x1
	.byte	0x6c
	.long	0x53
	.byte	0x3
	.byte	0x23
	.uleb128 0x1fc
	.uleb128 0x6
	.long	.LASF82
	.byte	0x1
	.byte	0x6d
	.long	0x53
	.byte	0x3
	.byte	0x23
	.uleb128 0x1fe
	.uleb128 0x6
	.long	.LASF83
	.byte	0x1
	.byte	0x6e
	.long	0x728
	.byte	0x3
	.byte	0x23
	.uleb128 0x200
	.uleb128 0x6
	.long	.LASF84
	.byte	0x1
	.byte	0x6f
	.long	0x53
	.byte	0x3
	.byte	0x23
	.uleb128 0x204
	.uleb128 0x6
	.long	.LASF85
	.byte	0x1
	.byte	0x70
	.long	0x65
	.byte	0x3
	.byte	0x23
	.uleb128 0x208
	.uleb128 0x6
	.long	.LASF86
	.byte	0x1
	.byte	0x71
	.long	0x65
	.byte	0x3
	.byte	0x23
	.uleb128 0x20c
	.uleb128 0x6
	.long	.LASF87
	.byte	0x1
	.byte	0x72
	.long	0x41
	.byte	0x3
	.byte	0x23
	.uleb128 0x210
	.uleb128 0x6
	.long	.LASF88
	.byte	0x1
	.byte	0x73
	.long	0x41
	.byte	0x3
	.byte	0x23
	.uleb128 0x211
	.uleb128 0x6
	.long	.LASF89
	.byte	0x1
	.byte	0x74
	.long	0x53
	.byte	0x3
	.byte	0x23
	.uleb128 0x212
	.uleb128 0x6
	.long	.LASF90
	.byte	0x1
	.byte	0x75
	.long	0x65
	.byte	0x3
	.byte	0x23
	.uleb128 0x214
	.uleb128 0x6
	.long	.LASF91
	.byte	0x1
	.byte	0x76
	.long	0x65
	.byte	0x3
	.byte	0x23
	.uleb128 0x218
	.uleb128 0x6
	.long	.LASF92
	.byte	0x1
	.byte	0x77
	.long	0x65
	.byte	0x3
	.byte	0x23
	.uleb128 0x21c
	.uleb128 0x6
	.long	.LASF93
	.byte	0x1
	.byte	0x78
	.long	0x65
	.byte	0x3
	.byte	0x23
	.uleb128 0x220
	.uleb128 0x6
	.long	.LASF94
	.byte	0x1
	.byte	0x79
	.long	0x53
	.byte	0x3
	.byte	0x23
	.uleb128 0x224
	.uleb128 0x6
	.long	.LASF95
	.byte	0x1
	.byte	0x7a
	.long	0x53
	.byte	0x3
	.byte	0x23
	.uleb128 0x226
	.uleb128 0x6
	.long	.LASF96
	.byte	0x1
	.byte	0x7b
	.long	0x65
	.byte	0x3
	.byte	0x23
	.uleb128 0x228
	.uleb128 0x6
	.long	.LASF97
	.byte	0x1
	.byte	0x7c
	.long	0x65
	.byte	0x3
	.byte	0x23
	.uleb128 0x22c
	.byte	0x0
	.uleb128 0x9
	.long	0x728
	.long	0xb2
	.uleb128 0x13
	.long	0xed
	.value	0x1f0
	.byte	0x0
	.uleb128 0x9
	.long	0x738
	.long	0xb2
	.uleb128 0xa
	.long	0xed
	.byte	0x3
	.byte	0x0
	.uleb128 0x14
	.long	0x7a9
	.long	.LASF98
	.byte	0x18
	.byte	0x1
	.value	0x152
	.uleb128 0x15
	.long	.LASF42
	.byte	0x1
	.value	0x153
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x16
	.string	"c"
	.byte	0x1
	.value	0x154
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x16
	.string	"h"
	.byte	0x1
	.value	0x154
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x16
	.string	"s"
	.byte	0x1
	.value	0x154
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x15
	.long	.LASF99
	.byte	0x1
	.value	0x155
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x15
	.long	.LASF12
	.byte	0x1
	.value	0x156
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x15
	.long	.LASF67
	.byte	0x1
	.value	0x157
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.byte	0x0
	.uleb128 0x14
	.long	0x84d
	.long	.LASF100
	.byte	0x10
	.byte	0x1
	.value	0x168
	.uleb128 0x15
	.long	.LASF101
	.byte	0x1
	.value	0x169
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x15
	.long	.LASF102
	.byte	0x1
	.value	0x16a
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x15
	.long	.LASF103
	.byte	0x1
	.value	0x16a
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x15
	.long	.LASF104
	.byte	0x1
	.value	0x16a
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x15
	.long	.LASF12
	.byte	0x1
	.value	0x16b
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x15
	.long	.LASF105
	.byte	0x1
	.value	0x16c
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x15
	.long	.LASF106
	.byte	0x1
	.value	0x16c
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x15
	.long	.LASF107
	.byte	0x1
	.value	0x16c
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x15
	.long	.LASF11
	.byte	0x1
	.value	0x16d
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x15
	.long	.LASF108
	.byte	0x1
	.value	0x16e
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x14
	.long	0x8af
	.long	.LASF109
	.byte	0x80
	.byte	0x1
	.value	0x172
	.uleb128 0x15
	.long	.LASF110
	.byte	0x1
	.value	0x173
	.long	0x356
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x16
	.string	"h"
	.byte	0x1
	.value	0x174
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x16
	.string	"s"
	.byte	0x1
	.value	0x175
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0x16
	.string	"c"
	.byte	0x1
	.value	0x176
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0x15
	.long	.LASF99
	.byte	0x1
	.value	0x177
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0x16
	.string	"pad"
	.byte	0x1
	.value	0x178
	.long	0x8af
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.byte	0x0
	.uleb128 0x9
	.long	0x8bf
	.long	0x41
	.uleb128 0xa
	.long	0xed
	.byte	0x68
	.byte	0x0
	.uleb128 0x17
	.long	0x90c
	.byte	0x1
	.long	.LASF112
	.byte	0x1
	.byte	0xb9
	.byte	0x1
	.long	0x90c
	.long	.LFB15
	.long	.LFE15
	.byte	0x1
	.byte	0x54
	.uleb128 0x18
	.long	.LASF114
	.byte	0x1
	.byte	0xb8
	.long	0x90c
	.byte	0x1
	.byte	0x57
	.uleb128 0x19
	.string	"p"
	.byte	0x1
	.byte	0xba
	.long	0x90c
	.byte	0x1
	.byte	0x53
	.uleb128 0x19
	.string	"wp"
	.byte	0x1
	.byte	0xbb
	.long	0x90c
	.byte	0x1
	.byte	0x56
	.uleb128 0x1a
	.long	.LASF111
	.byte	0x1
	.byte	0xbc
	.long	0x33
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x912
	.uleb128 0x10
	.long	0xb2
	.uleb128 0x1b
	.byte	0x1
	.string	"die"
	.byte	0x1
	.value	0x1ee
	.byte	0x1
	.long	.LFB18
	.long	.LFE18
	.byte	0x1
	.byte	0x54
	.uleb128 0x1c
	.long	0xa17
	.byte	0x1
	.long	.LASF113
	.byte	0x1
	.byte	0xed
	.byte	0x1
	.long	.LFB16
	.long	.LFE16
	.byte	0x1
	.byte	0x54
	.uleb128 0x18
	.long	.LASF115
	.byte	0x1
	.byte	0xec
	.long	0xa17
	.byte	0x2
	.byte	0x91
	.sleb128 52
	.uleb128 0x18
	.long	.LASF116
	.byte	0x1
	.byte	0xec
	.long	0xa17
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x1a
	.long	.LASF117
	.byte	0x1
	.byte	0xee
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1a
	.long	.LASF108
	.byte	0x1
	.byte	0xef
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.long	.LASF118
	.byte	0x1
	.byte	0xf0
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1a
	.long	.LASF119
	.byte	0x1
	.byte	0xf1
	.long	0x65
	.byte	0x1
	.byte	0x57
	.uleb128 0x1a
	.long	.LASF120
	.byte	0x1
	.byte	0xf1
	.long	0x65
	.byte	0x1
	.byte	0x55
	.uleb128 0x1a
	.long	.LASF121
	.byte	0x1
	.byte	0xf2
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1a
	.long	.LASF122
	.byte	0x1
	.byte	0xf2
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.long	.LASF123
	.byte	0x1
	.byte	0xf3
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x1a
	.long	.LASF99
	.byte	0x1
	.byte	0xf3
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x1a
	.long	.LASF124
	.byte	0x1
	.byte	0xf4
	.long	0x65
	.byte	0x1
	.byte	0x53
	.uleb128 0x19
	.string	"i"
	.byte	0x1
	.byte	0xf5
	.long	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.long	.LASF125
	.byte	0x1
	.byte	0xf5
	.long	0x33
	.uleb128 0x1e
	.long	.LBB2
	.long	.LBE2
	.uleb128 0x1f
	.long	.LASF126
	.byte	0x1
	.value	0x12c
	.long	0x65
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x65
	.uleb128 0x20
	.long	0xb5d
	.byte	0x1
	.long	.LASF127
	.byte	0x1
	.value	0x17e
	.byte	0x1
	.long	0xb5d
	.long	.LFB17
	.long	.LFE17
	.byte	0x1
	.byte	0x54
	.uleb128 0x21
	.long	.LASF117
	.byte	0x1
	.value	0x17d
	.long	0x65
	.byte	0x3
	.byte	0x91
	.sleb128 224
	.uleb128 0x21
	.long	.LASF108
	.byte	0x1
	.value	0x17d
	.long	0x65
	.byte	0x3
	.byte	0x91
	.sleb128 228
	.uleb128 0x1f
	.long	.LASF128
	.byte	0x1
	.value	0x17f
	.long	0x738
	.byte	0x5
	.byte	0x3
	.long	hd_geometry.0
	.uleb128 0x1f
	.long	.LASF129
	.byte	0x1
	.value	0x180
	.long	0xb68
	.byte	0x3
	.byte	0x91
	.sleb128 140
	.uleb128 0x1f
	.long	.LASF130
	.byte	0x1
	.value	0x181
	.long	0x84d
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1f
	.long	.LASF42
	.byte	0x1
	.value	0x182
	.long	0x70
	.byte	0x1
	.byte	0x55
	.uleb128 0x22
	.string	"v"
	.byte	0x1
	.value	0x182
	.long	0x70
	.byte	0x1
	.byte	0x50
	.uleb128 0x1f
	.long	.LASF131
	.byte	0x1
	.value	0x183
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1f
	.long	.LASF132
	.byte	0x1
	.value	0x183
	.long	0x70
	.byte	0x1
	.byte	0x56
	.uleb128 0x1f
	.long	.LASF133
	.byte	0x1
	.value	0x183
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x22
	.string	"c"
	.byte	0x1
	.value	0x184
	.long	0x70
	.byte	0x1
	.byte	0x50
	.uleb128 0x22
	.string	"h"
	.byte	0x1
	.value	0x184
	.long	0x70
	.byte	0x1
	.byte	0x51
	.uleb128 0x22
	.string	"s"
	.byte	0x1
	.value	0x184
	.long	0x70
	.byte	0x1
	.byte	0x52
	.uleb128 0x1f
	.long	.LASF99
	.byte	0x1
	.value	0x184
	.long	0x70
	.byte	0x1
	.byte	0x56
	.uleb128 0x22
	.string	"i"
	.byte	0x1
	.value	0x185
	.long	0x33
	.byte	0x1
	.byte	0x57
	.uleb128 0x23
	.long	.LASF134
	.byte	0x1
	.value	0x186
	.long	0x33
	.uleb128 0x22
	.string	"p"
	.byte	0x1
	.value	0x187
	.long	0x90c
	.byte	0x1
	.byte	0x50
	.uleb128 0x24
	.long	0xb78
	.long	.LBB3
	.long	.LBE3
	.uleb128 0x25
	.long	0xb89
	.uleb128 0x25
	.long	0xb94
	.uleb128 0x25
	.long	0xb9f
	.uleb128 0x26
	.long	.Ldebug_ranges0+0x0
	.uleb128 0x27
	.long	0xbaa
	.byte	0x1
	.byte	0x56
	.uleb128 0x27
	.long	0xbb5
	.byte	0x1
	.byte	0x51
	.uleb128 0x28
	.long	0xbc0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0xb63
	.uleb128 0x10
	.long	0x738
	.uleb128 0x9
	.long	0xb78
	.long	0x7a9
	.uleb128 0xa
	.long	0xed
	.byte	0x3
	.byte	0x0
	.uleb128 0x29
	.long	0xbcc
	.long	.LASF151
	.byte	0x2
	.byte	0x35
	.byte	0x1
	.long	0x33
	.byte	0x3
	.uleb128 0x2a
	.string	"__a"
	.byte	0x2
	.byte	0x34
	.long	0xbcc
	.uleb128 0x2a
	.string	"__b"
	.byte	0x2
	.byte	0x34
	.long	0xbcc
	.uleb128 0x2a
	.string	"__n"
	.byte	0x2
	.byte	0x34
	.long	0x70
	.uleb128 0x1d
	.long	.LASF135
	.byte	0x2
	.byte	0x36
	.long	0xbd3
	.uleb128 0x1d
	.long	.LASF136
	.byte	0x2
	.byte	0x37
	.long	0xbd3
	.uleb128 0x2b
	.string	"__d"
	.byte	0x2
	.byte	0x38
	.long	0x33
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0xbd2
	.uleb128 0x2c
	.uleb128 0xd
	.byte	0x4
	.long	0xbd9
	.uleb128 0x10
	.long	0x4c
	.uleb128 0x20
	.long	0xe2f
	.byte	0x1
	.long	.LASF137
	.byte	0x1
	.value	0x1ff
	.byte	0x1
	.long	0x65
	.long	.LFB19
	.long	.LFE19
	.byte	0x1
	.byte	0x54
	.uleb128 0x21
	.long	.LASF138
	.byte	0x1
	.value	0x1fe
	.long	0x287
	.byte	0x1
	.byte	0x50
	.uleb128 0x21
	.long	.LASF23
	.byte	0x1
	.value	0x1fe
	.long	0x269
	.byte	0x1
	.byte	0x50
	.uleb128 0x1f
	.long	.LASF139
	.byte	0x1
	.value	0x200
	.long	0x70
	.byte	0x1
	.byte	0x50
	.uleb128 0x23
	.long	.LASF140
	.byte	0x1
	.value	0x201
	.long	0xe2f
	.uleb128 0x1f
	.long	.LASF141
	.byte	0x1
	.value	0x202
	.long	0xe35
	.byte	0x1
	.byte	0x56
	.uleb128 0x1f
	.long	.LASF142
	.byte	0x1
	.value	0x203
	.long	0x53
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1f
	.long	.LASF143
	.byte	0x1
	.value	0x204
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1f
	.long	.LASF144
	.byte	0x1
	.value	0x204
	.long	0x65
	.byte	0x1
	.byte	0x53
	.uleb128 0x23
	.long	.LASF145
	.byte	0x1
	.value	0x205
	.long	0x53
	.uleb128 0x1f
	.long	.LASF146
	.byte	0x1
	.value	0x206
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1f
	.long	.LASF98
	.byte	0x1
	.value	0x207
	.long	0xb5d
	.byte	0x1
	.byte	0x55
	.uleb128 0x1f
	.long	.LASF31
	.byte	0x1
	.value	0x208
	.long	0x33
	.byte	0x1
	.byte	0x53
	.uleb128 0x23
	.long	.LASF147
	.byte	0x1
	.value	0x208
	.long	0x33
	.uleb128 0x1f
	.long	.LASF148
	.byte	0x1
	.value	0x209
	.long	0x1ca
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x1f
	.long	.LASF91
	.byte	0x1
	.value	0x20a
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x1f
	.long	.LASF92
	.byte	0x1
	.value	0x20a
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x2d
	.long	0xcf1
	.long	0xe3b
	.long	.LBB7
	.long	.LBE7
	.uleb128 0x25
	.long	0xe4c
	.byte	0x0
	.uleb128 0x2d
	.long	0xd0d
	.long	0xe58
	.long	.LBB9
	.long	.LBE9
	.uleb128 0x25
	.long	0xe65
	.uleb128 0x25
	.long	0xe70
	.byte	0x0
	.uleb128 0x2e
	.long	0xd27
	.long	.LBB12
	.long	.LBE12
	.uleb128 0x23
	.long	.LASF149
	.byte	0x1
	.value	0x28c
	.long	0x65
	.byte	0x0
	.uleb128 0x2e
	.long	0xda6
	.long	.LBB13
	.long	.LBE13
	.uleb128 0x22
	.string	"dpp"
	.byte	0x1
	.value	0x2bc
	.long	0xe7c
	.byte	0x1
	.byte	0x56
	.uleb128 0x2d
	.long	0xd63
	.long	0xe82
	.long	.LBB14
	.long	.LBE14
	.uleb128 0x25
	.long	0xe93
	.uleb128 0x25
	.long	0xe9e
	.uleb128 0x25
	.long	0xea9
	.byte	0x0
	.uleb128 0x2d
	.long	0xd86
	.long	0xe82
	.long	.LBB18
	.long	.LBE18
	.uleb128 0x25
	.long	0xe93
	.uleb128 0x25
	.long	0xe9e
	.uleb128 0x2f
	.long	0xea9
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.uleb128 0x24
	.long	0xe82
	.long	.LBB27
	.long	.LBE27
	.uleb128 0x25
	.long	0xe93
	.uleb128 0x25
	.long	0xe9e
	.uleb128 0x2f
	.long	0xea9
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.long	0xdc4
	.long	0xeb5
	.long	.LBB33
	.long	.LBE33
	.uleb128 0x25
	.long	0xec2
	.uleb128 0x2f
	.long	0xecd
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.uleb128 0x2d
	.long	0xde2
	.long	0xeb5
	.long	.LBB34
	.long	.LBE34
	.uleb128 0x25
	.long	0xec2
	.uleb128 0x2f
	.long	0xecd
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x2d
	.long	0xdfe
	.long	0xed9
	.long	.LBB41
	.long	.LBE41
	.uleb128 0x25
	.long	0xee6
	.uleb128 0x25
	.long	0xef1
	.byte	0x0
	.uleb128 0x1e
	.long	.LBB43
	.long	.LBE43
	.uleb128 0x1f
	.long	.LASF150
	.byte	0x1
	.value	0x2d3
	.long	0x41
	.byte	0x1
	.byte	0x50
	.uleb128 0x24
	.long	0xed9
	.long	.LBB44
	.long	.LBE44
	.uleb128 0x25
	.long	0xee6
	.uleb128 0x25
	.long	0xef1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x2ae
	.uleb128 0xd
	.byte	0x4
	.long	0x451
	.uleb128 0x29
	.long	0xe58
	.long	.LASF152
	.byte	0x1
	.byte	0x9a
	.byte	0x1
	.long	0x53
	.byte	0x3
	.uleb128 0x30
	.long	.LASF153
	.byte	0x1
	.byte	0x99
	.long	0x65
	.byte	0x0
	.uleb128 0x31
	.long	0xe7c
	.long	.LASF154
	.byte	0x1
	.byte	0x8b
	.byte	0x1
	.byte	0x3
	.uleb128 0x30
	.long	.LASF153
	.byte	0x1
	.byte	0x8a
	.long	0x65
	.uleb128 0x30
	.long	.LASF155
	.byte	0x1
	.byte	0x8a
	.long	0x53
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x4c
	.uleb128 0x29
	.long	0xeb5
	.long	.LASF156
	.byte	0x2
	.byte	0x2d
	.byte	0x1
	.long	0x269
	.byte	0x3
	.uleb128 0x2a
	.string	"__d"
	.byte	0x2
	.byte	0x2c
	.long	0x269
	.uleb128 0x2a
	.string	"__s"
	.byte	0x2
	.byte	0x2c
	.long	0xbcc
	.uleb128 0x2a
	.string	"__n"
	.byte	0x2
	.byte	0x2c
	.long	0x70
	.byte	0x0
	.uleb128 0x31
	.long	0xed9
	.long	.LASF157
	.byte	0x1
	.byte	0x90
	.byte	0x1
	.byte	0x3
	.uleb128 0x30
	.long	.LASF153
	.byte	0x1
	.byte	0x8f
	.long	0x65
	.uleb128 0x30
	.long	.LASF155
	.byte	0x1
	.byte	0x8f
	.long	0x65
	.byte	0x0
	.uleb128 0x31
	.long	0xefd
	.long	.LASF158
	.byte	0x1
	.byte	0x86
	.byte	0x1
	.byte	0x3
	.uleb128 0x30
	.long	.LASF153
	.byte	0x1
	.byte	0x85
	.long	0x65
	.uleb128 0x30
	.long	.LASF155
	.byte	0x1
	.byte	0x85
	.long	0x41
	.byte	0x0
	.uleb128 0x9
	.long	0xf08
	.long	0x89
	.uleb128 0x32
	.byte	0x0
	.uleb128 0x33
	.long	.LASF159
	.byte	0x5
	.byte	0x1b
	.long	0xefd
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF160
	.byte	0x5
	.byte	0x1c
	.long	0x33
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF161
	.byte	0x5
	.byte	0x1d
	.long	0x65
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF162
	.byte	0x5
	.byte	0x1d
	.long	0x65
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF163
	.byte	0x5
	.byte	0x1d
	.long	0x65
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF164
	.byte	0x4
	.byte	0x4d
	.long	0x1d5
	.byte	0x1
	.byte	0x1
	.uleb128 0x34
	.long	.LASF165
	.byte	0x1
	.value	0x1fb
	.long	0x287
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	syscall
	.uleb128 0x34
	.long	.LASF166
	.byte	0x1
	.value	0x1fc
	.long	0x269
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	sys_bounce
	.uleb128 0x9
	.long	0xf8c
	.long	0x912
	.uleb128 0xa
	.long	0xed
	.byte	0x17
	.byte	0x0
	.uleb128 0x35
	.long	.LASF167
	.byte	0x1
	.byte	0x14
	.long	0xf9e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	memdisk_version
	.uleb128 0x10
	.long	0xf7c
	.uleb128 0x9
	.long	0xfb3
	.long	0x912
	.uleb128 0xa
	.long	0xed
	.byte	0x22
	.byte	0x0
	.uleb128 0x35
	.long	.LASF168
	.byte	0x1
	.byte	0x16
	.long	0xfc5
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	copyright
	.uleb128 0x10
	.long	0xfa3
	.uleb128 0x9
	.long	0xfd5
	.long	0x912
	.uleb128 0x32
	.byte	0x0
	.uleb128 0x33
	.long	.LASF169
	.byte	0x1
	.byte	0x19
	.long	0xfe2
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.long	0xfca
	.uleb128 0x9
	.long	0xff2
	.long	0x912
	.uleb128 0x32
	.byte	0x0
	.uleb128 0x33
	.long	.LASF170
	.byte	0x1
	.byte	0x1a
	.long	0xfff
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.long	0xfe7
	.uleb128 0x35
	.long	.LASF171
	.byte	0x1
	.byte	0x7f
	.long	0x1016
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	shdr
	.uleb128 0x10
	.long	0x101b
	.uleb128 0xd
	.byte	0x4
	.long	0x1021
	.uleb128 0x10
	.long	0x5a2
	.uleb128 0x36
	.long	.LASF172
	.byte	0x1
	.byte	0xea
	.byte	0x1
	.byte	0x1
	.uleb128 0x9
	.long	0x103f
	.long	0xb63
	.uleb128 0xa
	.long	0xed
	.byte	0x7
	.byte	0x0
	.uleb128 0x1f
	.long	.LASF173
	.byte	0x1
	.value	0x15a
	.long	0x1051
	.byte	0x5
	.byte	0x3
	.long	geometries
	.uleb128 0x10
	.long	0x102f
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x27
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.uleb128 0x26
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.uleb128 0x21
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0xa5
	.value	0x2
	.long	.Ldebug_info0
	.long	0x1057
	.long	0x8bf
	.string	"getcmditem"
	.long	0x917
	.string	"die"
	.long	0x92b
	.string	"unzip_if_needed"
	.long	0xa1d
	.string	"get_disk_image_geometry"
	.long	0xbde
	.string	"setup"
	.long	0xf56
	.string	"syscall"
	.long	0xf69
	.string	"sys_bounce"
	.long	0xf8c
	.string	"memdisk_version"
	.long	0xfb3
	.string	"copyright"
	.long	0x1004
	.string	"shdr"
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.value	0x0
	.value	0x0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB4-.Ltext0
	.long	.LBE4-.Ltext0
	.long	.LBB6-.Ltext0
	.long	.LBE6-.Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF18:
	.string	"e820range"
.LASF15:
	.string	"_unused"
.LASF116:
	.string	"size_p"
.LASF79:
	.string	"vid_mode"
.LASF109:
	.string	"dosemu_header"
.LASF32:
	.string	"hd_dpt"
.LASF75:
	.string	"setup_secs"
.LASF9:
	.string	"uint64_t"
.LASF0:
	.string	"signed char"
.LASF148:
	.string	"regs"
.LASF12:
	.string	"type"
.LASF68:
	.string	"drivetype"
.LASF130:
	.string	"dosemu"
.LASF160:
	.string	"nranges"
.LASF10:
	.string	"long long unsigned int"
.LASF153:
	.string	"addr"
.LASF155:
	.string	"data"
.LASF98:
	.string	"geometry"
.LASF121:
	.string	"gzdatasize"
.LASF31:
	.string	"total_size"
.LASF129:
	.string	"ptab"
.LASF33:
	.string	"max_cyl"
.LASF78:
	.string	"ram_size"
.LASF77:
	.string	"swap_dev"
.LASF2:
	.string	"long long int"
.LASF43:
	.string	"isgap"
.LASF58:
	.string	"oldint15"
.LASF29:
	.string	"int15_offs"
.LASF134:
	.string	"drive_specified"
.LASF56:
	.string	"cmdline_seg"
.LASF119:
	.string	"startrange"
.LASF73:
	.string	"setup_header"
.LASF37:
	.string	"junk2"
.LASF101:
	.string	"active"
.LASF21:
	.string	"cs_cmdline"
.LASF76:
	.string	"syssize"
.LASF110:
	.string	"magic"
.LASF54:
	.string	"disksize"
.LASF39:
	.string	"specify1"
.LASF40:
	.string	"specify2"
.LASF82:
	.string	"jump"
.LASF176:
	.string	"/home/lfs-kable/bootcd/extra/syslinux-3.09/memdisk"
.LASF115:
	.string	"where_p"
.LASF111:
	.string	"match"
.LASF5:
	.string	"uint16_t"
.LASF26:
	.string	"syscall_t"
.LASF125:
	.string	"okmem"
.LASF53:
	.string	"diskbuf"
.LASF146:
	.string	"stddosmem"
.LASF140:
	.string	"hptr"
.LASF164:
	.string	"__com32"
.LASF156:
	.string	"memcpy_endptr"
.LASF118:
	.string	"zbytes"
.LASF60:
	.string	"bootloaderid"
.LASF120:
	.string	"endrange"
.LASF131:
	.string	"max_c"
.LASF104:
	.string	"start_c"
.LASF132:
	.string	"max_h"
.LASF102:
	.string	"start_h"
.LASF169:
	.string	"_binary_memdisk_bin_start"
.LASF133:
	.string	"max_s"
.LASF170:
	.string	"_binary_memdisk_bin_size"
.LASF67:
	.string	"driveno"
.LASF8:
	.string	"unsigned int"
.LASF163:
	.string	"high_mem"
.LASF24:
	.string	"cs_bounce_size"
.LASF25:
	.string	"cs_farcall"
.LASF81:
	.string	"boot_flag"
.LASF23:
	.string	"cs_bounce"
.LASF47:
	.string	"settle"
.LASF108:
	.string	"size"
.LASF6:
	.string	"short unsigned int"
.LASF72:
	.string	"statusptr"
.LASF96:
	.string	"cmd_line_ptr"
.LASF14:
	.string	"reg32_t"
.LASF100:
	.string	"ptab_entry"
.LASF45:
	.string	"fgap"
.LASF19:
	.string	"com32_sys_args"
.LASF172:
	.string	"_end"
.LASF124:
	.string	"target"
.LASF166:
	.string	"sys_bounce"
.LASF88:
	.string	"loadflags"
.LASF44:
	.string	"dlen"
.LASF144:
	.string	"driveraddr"
.LASF70:
	.string	"configflags"
.LASF113:
	.string	"unzip_if_needed"
.LASF62:
	.string	"memint1588"
.LASF143:
	.string	"driverptr"
.LASF174:
	.string	"GNU C 3.4.1"
.LASF38:
	.string	"fd_dpt"
.LASF97:
	.string	"initrd_addr_max"
.LASF71:
	.string	"mystack"
.LASF126:
	.string	"newwhere"
.LASF20:
	.string	"cs_sysargs"
.LASF91:
	.string	"ramdisk_image"
.LASF175:
	.string	"setup.c"
.LASF86:
	.string	"start_sys"
.LASF34:
	.string	"max_head"
.LASF90:
	.string	"code32_start"
.LASF16:
	.string	"eflags"
.LASF50:
	.string	"old_fd_dpt"
.LASF49:
	.string	"_pad1"
.LASF158:
	.string	"wrz_8"
.LASF137:
	.string	"setup"
.LASF94:
	.string	"head_end_ptr"
.LASF123:
	.string	"orig_crc"
.LASF93:
	.string	"bootsect_kludge"
.LASF122:
	.string	"gzwhere"
.LASF141:
	.string	"pptr"
.LASF66:
	.string	"mem16mb"
.LASF106:
	.string	"end_s"
.LASF92:
	.string	"ramdisk_size"
.LASF159:
	.string	"ranges"
.LASF165:
	.string	"syscall"
.LASF30:
	.string	"patch_offs"
.LASF57:
	.string	"oldint13"
.LASF157:
	.string	"wrz_32"
.LASF3:
	.string	"unsigned char"
.LASF150:
	.string	"equip"
.LASF107:
	.string	"end_c"
.LASF41:
	.string	"delay"
.LASF167:
	.string	"memdisk_version"
.LASF1:
	.string	"short int"
.LASF152:
	.string	"rdz_16"
.LASF105:
	.string	"end_h"
.LASF145:
	.string	"dosmem_k"
.LASF171:
	.string	"shdr"
.LASF89:
	.string	"setup_move_size"
.LASF117:
	.string	"where"
.LASF168:
	.string	"copyright"
.LASF173:
	.string	"geometries"
.LASF42:
	.string	"sectors"
.LASF61:
	.string	"_pad"
.LASF51:
	.string	"dpt_t"
.LASF128:
	.string	"hd_geometry"
.LASF7:
	.string	"uint32_t"
.LASF27:
	.string	"memdisk_header"
.LASF13:
	.string	"char"
.LASF80:
	.string	"root_dev"
.LASF46:
	.string	"ffill"
.LASF59:
	.string	"olddosmem"
.LASF135:
	.string	"__aa"
.LASF74:
	.string	"cmdline"
.LASF151:
	.string	"memcmp"
.LASF99:
	.string	"offset"
.LASF65:
	.string	"mem1mb"
.LASF36:
	.string	"ctrl"
.LASF55:
	.string	"cmdline_off"
.LASF147:
	.string	"cmdlinelen"
.LASF84:
	.string	"version"
.LASF161:
	.string	"dos_mem"
.LASF52:
	.string	"patch_area"
.LASF112:
	.string	"getcmditem"
.LASF64:
	.string	"heads"
.LASF28:
	.string	"int13_offs"
.LASF154:
	.string	"wrz_16"
.LASF95:
	.string	"pad1"
.LASF48:
	.string	"mstart"
.LASF114:
	.string	"what"
.LASF69:
	.string	"drivecnt"
.LASF138:
	.string	"cs_syscall"
.LASF4:
	.string	"uint8_t"
.LASF85:
	.string	"realmode_swtch"
.LASF63:
	.string	"cylinders"
.LASF35:
	.string	"junk1"
.LASF139:
	.string	"bin_size"
.LASF136:
	.string	"__bb"
.LASF87:
	.string	"type_of_loader"
.LASF142:
	.string	"driverseg"
.LASF22:
	.string	"cs_intcall"
.LASF11:
	.string	"start"
.LASF17:
	.string	"com32sys_t"
.LASF162:
	.string	"low_mem"
.LASF127:
	.string	"get_disk_image_geometry"
.LASF149:
	.string	"int1588mem"
.LASF83:
	.string	"header"
.LASF103:
	.string	"start_s"
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.4.1"
