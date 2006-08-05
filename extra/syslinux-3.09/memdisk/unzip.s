	.file	"unzip.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.ident	"$Id: memdisk.h,v 1.9 2005/03/08 18:39:32 hpa Exp $"
	.ident	"$Id: conio.h,v 1.5 2004/12/14 22:46:25 hpa Exp $"
	.local	bytes_out
	.comm	bytes_out,4,4
	.section	.rodata
	.align 32
	.type	cpdext, @object
	.size	cpdext, 60
cpdext:
	.value	0
	.value	0
	.value	0
	.value	0
	.value	1
	.value	1
	.value	2
	.value	2
	.value	3
	.value	3
	.value	4
	.value	4
	.value	5
	.value	5
	.value	6
	.value	6
	.value	7
	.value	7
	.value	8
	.value	8
	.value	9
	.value	9
	.value	10
	.value	10
	.value	11
	.value	11
	.value	12
	.value	12
	.value	13
	.value	13
	.align 32
	.type	cpdist, @object
	.size	cpdist, 60
cpdist:
	.value	1
	.value	2
	.value	3
	.value	4
	.value	5
	.value	7
	.value	9
	.value	13
	.value	17
	.value	25
	.value	33
	.value	49
	.value	65
	.value	97
	.value	129
	.value	193
	.value	257
	.value	385
	.value	513
	.value	769
	.value	1025
	.value	1537
	.value	2049
	.value	3073
	.value	4097
	.value	6145
	.value	8193
	.value	12289
	.value	16385
	.value	24577
	.align 32
	.type	cplext, @object
	.size	cplext, 62
cplext:
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	1
	.value	1
	.value	1
	.value	1
	.value	2
	.value	2
	.value	2
	.value	2
	.value	3
	.value	3
	.value	3
	.value	3
	.value	4
	.value	4
	.value	4
	.value	4
	.value	5
	.value	5
	.value	5
	.value	5
	.value	0
	.value	99
	.value	99
	.align 32
	.type	cplens, @object
	.size	cplens, 62
cplens:
	.value	3
	.value	4
	.value	5
	.value	6
	.value	7
	.value	8
	.value	9
	.value	10
	.value	11
	.value	13
	.value	15
	.value	17
	.value	19
	.value	23
	.value	27
	.value	31
	.value	35
	.value	43
	.value	51
	.value	59
	.value	67
	.value	83
	.value	99
	.value	115
	.value	131
	.value	163
	.value	195
	.value	227
	.value	258
	.value	0
	.value	0
	.align 32
	.type	mask_bits, @object
	.size	mask_bits, 34
mask_bits:
	.value	0
	.value	1
	.value	3
	.value	7
	.value	15
	.value	31
	.value	63
	.value	127
	.value	255
	.value	511
	.value	1023
	.value	2047
	.value	4095
	.value	8191
	.value	16383
	.value	32767
	.value	-1
	.align 32
	.type	border, @object
	.size	border, 76
border:
	.long	16
	.long	17
	.long	18
	.long	0
	.long	8
	.long	7
	.long	9
	.long	6
	.long	10
	.long	5
	.long	11
	.long	4
	.long	12
	.long	3
	.long	13
	.long	2
	.long	14
	.long	1
	.long	15
	.text
	.p2align 2,,3
	.type	huft_free, @function
huft_free:
.LFB12:
	.file 1 "inflate.c"
	.loc 1 488 0
.L8:
	.loc 1 498 0
	testl	%eax, %eax
	je	.L7
	.loc 1 496 0
	movl	-4(%eax), %eax
	jmp	.L8
.L7:
	.loc 1 501 0
	xorl	%eax, %eax
	ret
.LFE12:
	.size	huft_free, .-huft_free
	.p2align 2,,3
	.type	gzip_release, @function
gzip_release:
.LFB24:
	.file 2 "unzip.c"
	.loc 2 134 0
	.loc 2 135 0
	movl	(%eax), %eax
	movl	%eax, free_mem_ptr
	ret
.LFE24:
	.size	gzip_release, .-gzip_release
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"failed\nDecompression error: %s\n"
	.text
	.p2align 2,,3
	.type	error, @function
error:
.LFB27:
	.loc 2 176 0
	.loc 2 177 0
	pushl	%eax
.LCFI0:
	pushl	$.LC0
.LCFI1:
	call	printf
	.loc 2 178 0
.LCFI2:
	call	die
.LCFI3:
.LFE27:
	.size	error, .-error
	.section	.rodata.str1.1
.LC1:
	.string	"malloc error"
.LC2:
	.string	"out of memory"
	.text
	.p2align 2,,3
	.type	huft_build, @function
huft_build:
.LFB11:
	.loc 1 278 0
	pushl	%ebp
.LCFI4:
	pushl	%edi
.LCFI5:
	pushl	%esi
.LCFI6:
	pushl	%ebx
.LCFI7:
	subl	$1436, %esp
.LCFI8:
	.loc 1 278 0
	movl	%eax, 56(%esp)
	movl	$0, 24(%esp)
	movl	$0, 28(%esp)
	movl	%edx, 52(%esp)
	movl	1472(%esp), %ebx
	.loc 1 302 0
	leal	1356(%esp), %eax
	pushl	$68
.LCFI9:
	pushl	$0
.LCFI10:
	pushl	%eax
.LCFI11:
	call	memset
	.loc 1 303 0
	movl	68(%esp), %ebp
	movl	64(%esp), %edi
	.loc 1 304 0
	addl	$12, %esp
.LCFI12:
.L12:
	.loc 1 307 0
	movl	(%ebp), %eax
	incl	1356(%esp,%eax,4)
	.loc 1 308 0
	addl	$4, %ebp
	.loc 1 309 0
	decl	%edi
	jne	.L12
	.loc 1 310 0
	movl	52(%esp), %eax
	cmpl	%eax, 1356(%esp)
	jne	.L15
	.loc 1 312 0
	movl	1468(%esp), %edx
	.loc 1 314 0
	xorl	%eax, %eax
	.loc 1 312 0
	movl	$0, (%edx)
	.loc 1 313 0
	movl	$0, (%ebx)
	.loc 1 314 0
	jmp	.L11
.L15:
	.loc 1 320 0
	movl	(%ebx), %ecx
	movl	%ecx, 32(%esp)
	.loc 1 321 0
	movl	$1, %esi
.L20:
	.loc 1 322 0
	cmpl	$0, 1356(%esp,%esi,4)
	jne	.L17
	.loc 1 321 0
	incl	%esi
	cmpl	$16, %esi
	jbe	.L20
.L17:
	.loc 1 325 0
	cmpl	%esi, 32(%esp)
	.loc 1 324 0
	movl	%esi, 36(%esp)
	.loc 1 325 0
	jae	.L21
	.loc 1 326 0
	movl	%esi, 32(%esp)
.L21:
	.loc 1 327 0
	movl	$16, %edi
.L26:
	.loc 1 328 0
	cmpl	$0, 1356(%esp,%edi,4)
	jne	.L23
	.loc 1 327 0
	decl	%edi
	jne	.L26
.L23:
	.loc 1 331 0
	cmpl	%edi, 32(%esp)
	.loc 1 330 0
	movl	%edi, 44(%esp)
	.loc 1 331 0
	jbe	.L27
	.loc 1 332 0
	movl	%edi, 32(%esp)
.L27:
	.loc 1 333 0
	movl	32(%esp), %edx
	.loc 1 338 0
	movl	$1, 16(%esp)
	movl	%esi, %ecx
	sall	%cl, 16(%esp)
	.loc 1 333 0
	movl	%edx, (%ebx)
	.loc 1 338 0
	cmpl	44(%esp), %esi
.L102:
	jae	.L85
	.loc 1 339 0
	movl	1356(%esp,%esi,4), %ebx
	subl	%ebx, 16(%esp)
	js	.L101
	.loc 1 338 0
	incl	%esi
	sall	16(%esp)
	cmpl	%edi, %esi
	jmp	.L102
.L85:
	.loc 1 341 0
	movl	1356(%esp,%edi,4), %eax
	subl	%eax, 16(%esp)
	jns	.L33
.L101:
	.loc 1 340 0
	movl	$2, %eax
	jmp	.L11
.L33:
	.loc 1 343 0
	addl	16(%esp), %eax
	movl	%eax, 1356(%esp,%edi,4)
	.loc 1 348 0
	xorl	%esi, %esi
	movl	$0, 64(%esp)
	.loc 1 349 0
	leal	1360(%esp), %ebp
	leal	68(%esp), %ecx
.L103:
	.loc 1 351 0
	decl	%edi
	je	.L87
	addl	(%ebp), %esi
	movl	%esi, (%ecx)
	addl	$4, %ebp
	addl	$4, %ecx
	jmp	.L103
.L87:
	.loc 1 357 0
	movl	56(%esp), %ebp
	xorl	%edi, %edi
.L37:
	.loc 1 359 0
	movl	(%ebp), %ecx
	addl	$4, %ebp
	testl	%ecx, %ecx
	je	.L39
	.loc 1 360 0
	movl	60(%esp,%ecx,4), %eax
	movl	%edi, 140(%esp,%eax,4)
	incl	%eax
	movl	%eax, 60(%esp,%ecx,4)
.L39:
	.loc 1 361 0
	incl	%edi
	cmpl	52(%esp), %edi
	jb	.L37
	.loc 1 369 0
	movl	32(%esp), %esi
	negl	%esi
	.loc 1 376 0
	movl	44(%esp), %eax
	xorl	%edi, %edi
	.loc 1 366 0
	movl	$0, 60(%esp)
	.loc 1 367 0
	leal	140(%esp), %ebp
	.loc 1 368 0
	movl	$-1, 40(%esp)
	.loc 1 369 0
	movl	%esi, 20(%esp)
	.loc 1 370 0
	movl	$0, 1292(%esp)
	.loc 1 371 0
	movl	$0, (%esp)
	.loc 1 372 0
	movl	$0, 12(%esp)
	.loc 1 376 0
	cmpl	%eax, 36(%esp)
.L104:
	jg	.L89
	.loc 1 468 0
	movl	36(%esp), %edx
	movl	1356(%esp,%edx,4), %ecx
	decl	%ecx
	movl	%ecx, 48(%esp)
	incl	%ecx
.L105:
	je	.L91
	.loc 1 431 0
	movl	20(%esp), %ebx
	addl	32(%esp), %ebx
	movl	%ebx, 8(%esp)
	cmpl	%ebx, 36(%esp)
.L106:
	jle	.L93
	.loc 1 389 0
	movl	8(%esp), %esi
	.loc 1 392 0
	movl	44(%esp), %eax
	subl	%esi, %eax
	movl	32(%esp), %ebx
	.loc 1 388 0
	incl	40(%esp)
	.loc 1 392 0
	cmpl	%ebx, %eax
	.loc 1 389 0
	movl	%esi, 20(%esp)
	.loc 1 392 0
	movl	%eax, 12(%esp)
	ja	.L49
	movl	%eax, %ebx
.L49:
	.loc 1 393 0
	movl	36(%esp), %esi
	subl	8(%esp), %esi
	movl	$1, %edx
	movl	%esi, %ecx
	movl	48(%esp), %eax
	sall	%cl, %edx
	incl	%eax
	cmpl	%eax, %edx
	.loc 1 392 0
	movl	%ebx, 12(%esp)
	.loc 1 393 0
	jbe	.L50
	.loc 1 396 0
	movl	%edx, %eax
	subl	48(%esp), %eax
	leal	-1(%eax), %edx
	.loc 1 397 0
	movl	36(%esp), %eax
	leal	1356(%esp,%eax,4), %ecx
.L107:
	.loc 1 402 0
	incl	%esi
	cmpl	%ebx, %esi
	jae	.L50
	.loc 1 400 0
	addl	$4, %ecx
	sall	%edx
	movl	(%ecx), %eax
	cmpl	%eax, %edx
	jbe	.L50
	.loc 1 402 0
	subl	%eax, %edx
	jmp	.L107
.L50:
	.loc 1 406 0
	movl	$1, 12(%esp)
	movl	%esi, %ecx
	sall	%cl, 12(%esp)
.LBB2:
	.loc 2 106 0
	movl	12(%esp), %ebx
	leal	8(,%ebx,8), %ebx
.LBB3:
	.loc 2 109 0
	testl	%ebx, %ebx
.LBE3:
	.loc 2 106 0
	movl	%ebx, 4(%esp)
.LBB4:
	.loc 2 109 0
	jns	.L56
	movl	$.LC1, %eax
	call	error
.L56:
	.loc 2 111 0
	movl	free_mem_ptr, %ebx
	addl	$3, %ebx
	andl	$-4, %ebx
	.loc 2 114 0
	movl	4(%esp), %edx
	leal	(%ebx,%edx), %eax
	.loc 2 116 0
	cmpl	free_mem_end_ptr, %eax
	.loc 2 114 0
	movl	%eax, free_mem_ptr
	.loc 2 116 0
	jb	.L57
	.loc 2 117 0
	movl	$.LC2, %eax
	call	error
.L57:
.LBE4:
.LBE2:
	.loc 2 106 0
	testl	%ebx, %ebx
	movl	%ebx, (%esp)
	jne	.L55
	.loc 1 412 0
	cmpl	$0, 40(%esp)
	je	.L59
	.loc 1 413 0
	movl	1292(%esp), %eax
	call	huft_free
.L59:
	.loc 1 414 0
	movl	$3, %eax
	jmp	.L11
.L55:
	.loc 1 417 0
	movl	12(%esp), %eax
	addl	hufts, %eax
	incl	%eax
	movl	%eax, hufts
	.loc 1 418 0
	movl	(%esp), %eax
	addl	$8, %eax
	movl	1468(%esp), %ecx
	movl	%eax, (%ecx)
	.loc 1 419 0
	movl	(%esp), %ebx
	.loc 1 420 0
	movl	40(%esp), %ecx
	.loc 1 419 0
	addl	$4, %ebx
	movl	(%esp), %edx
	.loc 1 424 0
	testl	%ecx, %ecx
	.loc 1 419 0
	movl	$0, 4(%edx)
	movl	%ebx, 1468(%esp)
	.loc 1 420 0
	movl	%eax, (%esp)
	movl	%eax, 1292(%esp,%ecx,4)
	.loc 1 424 0
	je	.L46
	.loc 1 427 0
	movl	24(%esp), %ebx
	movb	32(%esp), %bh
	movl	%ebx, 24(%esp)
	.loc 1 426 0
	movl	%edi, 60(%esp,%ecx,4)
	.loc 1 428 0
	leal	16(%esi), %eax
	.loc 1 430 0
	movl	8(%esp), %ecx
	.loc 1 429 0
	movl	(%esp), %esi
	.loc 1 428 0
	movb	%al, 24(%esp)
	.loc 1 429 0
	movl	%esi, 28(%esp)
	.loc 1 430 0
	subl	32(%esp), %ecx
	.loc 1 431 0
	movl	40(%esp), %edx
	.loc 1 430 0
	movl	%edi, %esi
	shrl	%cl, %esi
	.loc 1 431 0
	movl	1288(%esp,%edx,4), %eax
	movl	24(%esp), %ecx
	movl	28(%esp), %ebx
	movl	%ebx, 4(%eax,%esi,8)
	movl	%ecx, (%eax,%esi,8)
.L46:
	movl	32(%esp), %ebx
	addl	%ebx, 8(%esp)
	movl	8(%esp), %esi
	cmpl	%esi, 36(%esp)
	jmp	.L106
.L93:
	.loc 1 438 0
	movb	36(%esp), %al
	subb	20(%esp), %al
	movl	24(%esp), %edx
	.loc 1 439 0
	movl	52(%esp), %ecx
	.loc 1 438 0
	movb	%al, %dh
	.loc 1 439 0
	leal	140(%esp,%ecx,4), %eax
	cmpl	%eax, %ebp
	.loc 1 438 0
	movl	%edx, 24(%esp)
	.loc 1 439 0
	jb	.L62
	.loc 1 440 0
	movb	$99, 24(%esp)
	jmp	.L63
.L62:
	.loc 1 441 0
	movl	(%ebp), %edx
	cmpl	1456(%esp), %edx
	jae	.L64
	.loc 1 443 0
	cmpl	$256, %edx
	sbbl	%eax, %eax
	notl	%eax
	addl	$16, %eax
	movb	%al, 24(%esp)
	.loc 1 444 0
	movw	%dx, 28(%esp)
	jmp	.L108
.L64:
	.loc 1 449 0
	movl	%edx, %eax
	subl	1456(%esp), %eax
	movl	24(%esp), %edx
	movl	28(%esp), %ecx
	movl	1464(%esp), %ebx
	.loc 1 450 0
	movl	1460(%esp), %esi
	.loc 1 449 0
	movb	(%ebx,%eax,2), %dl
	.loc 1 450 0
	movw	(%esi,%eax,2), %cx
	movl	%edx, 24(%esp)
	movl	%ecx, 28(%esp)
.L108:
	addl	$4, %ebp
.L63:
	.loc 1 455 0
	movl	36(%esp), %ecx
	subl	20(%esp), %ecx
	movl	$1, %edx
	sall	%cl, %edx
	.loc 1 456 0
	movl	%edi, %esi
	movb	20(%esp), %cl
	shrl	%cl, %esi
.L109:
	cmpl	12(%esp), %esi
	jae	.L96
	.loc 1 457 0
	movl	24(%esp), %ecx
	movl	28(%esp), %ebx
	movl	(%esp), %eax
	movl	%ecx, (%eax,%esi,8)
	movl	%ebx, 4(%eax,%esi,8)
	.loc 1 456 0
	addl	%edx, %esi
	jmp	.L109
.L96:
	.loc 1 460 0
	movl	36(%esp), %ecx
	decl	%ecx
	movl	$1, %esi
	sall	%cl, %esi
.L110:
	testl	%esi, %edi
	je	.L98
	.loc 1 461 0
	xorl	%esi, %edi
	.loc 1 460 0
	shrl	%esi
	jmp	.L110
.L98:
	.loc 1 462 0
	xorl	%esi, %edi
.L111:
	.loc 1 468 0
	movl	$1, %eax
	movb	20(%esp), %cl
	sall	%cl, %eax
	decl	%eax
	andl	%edi, %eax
	movl	40(%esp), %ebx
	cmpl	60(%esp,%ebx,4), %eax
	je	.L100
	movl	32(%esp), %eax
	.loc 1 467 0
	decl	40(%esp)
	.loc 1 468 0
	subl	%eax, 20(%esp)
	jmp	.L111
.L100:
	decl	48(%esp)
	cmpl	$-1, 48(%esp)
	jmp	.L105
.L91:
	.loc 1 376 0
	incl	36(%esp)
	movl	44(%esp), %esi
	cmpl	%esi, 36(%esp)
	jmp	.L104
.L89:
	.loc 1 478 0
	xorl	%eax, %eax
	cmpl	$0, 16(%esp)
	je	.L11
	cmpl	$1, 44(%esp)
	je	.L11
	movb	$1, %al
.L11:
	.loc 1 479 0
	addl	$1436, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.LFE11:
	.size	huft_build, .-huft_build
	.section	.rodata.str1.1
.LC3:
	.string	"output buffer overrun"
	.text
	.p2align 2,,3
	.type	flush_window, @function
flush_window:
.LFB26:
	.loc 2 155 0
	.loc 2 160 0
	movl	outcnt, %eax
	addl	bytes_out, %eax
	.loc 2 155 0
	pushl	%esi
.LCFI13:
	.loc 2 160 0
	cmpl	output_size, %eax
	.loc 2 155 0
	pushl	%ebx
.LCFI14:
	.loc 2 156 0
	movl	crc, %ebx
	.loc 2 160 0
	jbe	.L113
	.loc 2 161 0
	movl	$.LC3, %eax
	call	error
.L113:
	.loc 2 163 0
	movl	$window, %esi
	.loc 2 164 0
	movl	output_data, %edx
	.loc 2 165 0
	xorl	%ecx, %ecx
.L120:
	cmpl	outcnt, %ecx
	jae	.L119
	.loc 2 166 0
	movb	(%esi), %al
	movb	%al, (%edx)
	.loc 2 167 0
	xorl	%ebx, %eax
	movzbl	%al, %eax
	shrl	$8, %ebx
	.loc 2 166 0
	incl	%esi
	incl	%edx
	.loc 2 167 0
	xorl	crc_32_tab(,%eax,4), %ebx
	.loc 2 165 0
	incl	%ecx
	jmp	.L120
.L119:
	.loc 2 171 0
	movl	outcnt, %eax
	.loc 2 169 0
	movl	%ebx, crc
	.loc 2 172 0
	popl	%ebx
	.loc 2 171 0
	addl	%eax, bytes_out
	.loc 2 172 0
	popl	%esi
	.loc 2 170 0
	movl	%edx, output_data
	.loc 2 172 0
	movl	$0, outcnt
	ret
.LFE26:
	.size	flush_window, .-flush_window
	.section	.rodata.str1.1
.LC4:
	.string	"failed\nDecompression error: ran out of input data"
	.text
	.p2align 2,,3
	.type	fill_inbuf, @function
fill_inbuf:
.LFB25:
	.loc 2 143 0
	.loc 2 146 0
	pushl	$.LC4
.LCFI15:
	call	puts
	.loc 2 147 0
.LCFI16:
	call	die
.LCFI17:
.LFE25:
	.size	fill_inbuf, .-fill_inbuf
	.p2align 2,,3
	.type	inflate_codes, @function
inflate_codes:
.LFB13:
	.loc 1 509 0
	pushl	%ebp
.LCFI18:
	pushl	%edi
.LCFI19:
	pushl	%esi
.LCFI20:
	pushl	%ebx
.LCFI21:
	subl	$24, %esp
.LCFI22:
	.loc 1 509 0
	movl	%edx, 16(%esp)
	.loc 1 526 0
	movl	48(%esp), %ecx
	.loc 1 525 0
	movl	44(%esp), %edx
	.loc 1 509 0
	movl	%eax, 20(%esp)
	.loc 1 525 0
	movzwl	mask_bits(%edx,%edx), %edx
	.loc 1 522 0
	movl	outcnt, %eax
	.loc 1 526 0
	movzwl	mask_bits(%ecx,%ecx), %ecx
	.loc 1 520 0
	movl	bb, %ebp
	.loc 1 521 0
	movl	bk, %esi
	.loc 1 522 0
	movl	%eax, 8(%esp)
	.loc 1 525 0
	movl	%edx, 4(%esp)
	.loc 1 526 0
	movl	%ecx, (%esp)
.L211:
	.loc 1 529 0
	cmpl	44(%esp), %esi
	jae	.L189
.LBB5:
.LBB6:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L127
.LBB7:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L128
.L127:
.LBE7:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L128:
.LBE6:
.LBE5:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %ebp
	.loc 1 529 0
	addl	$8, %esi
	jmp	.L211
.L189:
	.loc 1 530 0
	movl	4(%esp), %eax
	andl	%ebp, %eax
	movl	20(%esp), %edx
.L203:
	leal	(%edx,%eax,8), %edi
	movzbl	(%edi), %ebx
	cmpl	$16, %ebx
	jbe	.L131
	.loc 1 532 0
	cmpl	$99, %ebx
	je	.L210
	.loc 1 534 0
	movzbl	1(%edi), %ecx
	shrl	%cl, %ebp
	subl	%ecx, %esi
	.loc 1 535 0
	subl	$16, %ebx
.L204:
	.loc 1 536 0
	cmpl	%ebx, %esi
	jae	.L191
.LBB8:
.LBB9:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L138
.LBB10:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L139
.L138:
.LBE10:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L139:
.LBE9:
.LBE8:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %ebp
	.loc 1 536 0
	addl	$8, %esi
	jmp	.L204
.L191:
	.loc 1 537 0
	movzwl	mask_bits(%ebx,%ebx), %eax
	andl	%ebp, %eax
	movl	4(%edi), %edx
	jmp	.L203
.L131:
	.loc 1 538 0
	movzbl	1(%edi), %ecx
	shrl	%cl, %ebp
	subl	%ecx, %esi
	.loc 1 539 0
	cmpl	$16, %ebx
	jne	.L142
	.loc 1 541 0
	movl	8(%esp), %edx
	movw	4(%edi), %ax
	movb	%al, window(%edx)
	incl	%edx
	.loc 1 543 0
	cmpl	$32768, %edx
	.loc 1 541 0
	movl	%edx, 8(%esp)
	.loc 1 543 0
	jne	.L211
	.loc 1 545 0
	movl	$32768, outcnt
	call	flush_window
	.loc 1 546 0
	movl	$0, 8(%esp)
	jmp	.L211
.L142:
	.loc 1 552 0
	cmpl	$15, %ebx
	je	.L124
.L205:
	.loc 1 556 0
	cmpl	%ebx, %esi
	jae	.L193
.LBB11:
.LBB12:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L148
.LBB13:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L149
.L148:
.LBE13:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L149:
.LBE12:
.LBE11:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %ebp
	.loc 1 556 0
	addl	$8, %esi
	jmp	.L205
.L193:
	.loc 1 557 0
	movzwl	mask_bits(%ebx,%ebx), %eax
	movzwl	4(%edi), %edx
	andl	%ebp, %eax
	addl	%eax, %edx
	.loc 1 558 0
	movb	%bl, %cl
	.loc 1 557 0
	movl	%edx, 12(%esp)
	.loc 1 558 0
	shrl	%cl, %ebp
	subl	%ebx, %esi
.L206:
	.loc 1 561 0
	cmpl	48(%esp), %esi
	jae	.L195
.LBB14:
.LBB15:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L154
.LBB16:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L155
.L154:
.LBE16:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L155:
.LBE15:
.LBE14:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %ebp
	.loc 1 561 0
	addl	$8, %esi
	jmp	.L206
.L195:
	.loc 1 562 0
	movl	(%esp), %eax
	andl	%ebp, %eax
	movl	16(%esp), %edx
.L207:
	leal	(%edx,%eax,8), %edi
	movzbl	(%edi), %ebx
	cmpl	$16, %ebx
	jbe	.L158
	.loc 1 564 0
	cmpl	$99, %ebx
	jne	.L162
.L210:
	.loc 1 565 0
	movl	$1, %eax
	jmp	.L122
.L162:
	.loc 1 566 0
	movzbl	1(%edi), %ecx
	shrl	%cl, %ebp
	subl	%ecx, %esi
	.loc 1 567 0
	subl	$16, %ebx
.L208:
	.loc 1 568 0
	cmpl	%ebx, %esi
	jae	.L197
.LBB17:
.LBB18:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L165
.LBB19:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L166
.L165:
.LBE19:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L166:
.LBE18:
.LBE17:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %ebp
	.loc 1 568 0
	addl	$8, %esi
	jmp	.L208
.L197:
	.loc 1 569 0
	movzwl	mask_bits(%ebx,%ebx), %eax
	andl	%ebp, %eax
	movl	4(%edi), %edx
	jmp	.L207
.L158:
	.loc 1 570 0
	movzbl	1(%edi), %ecx
	shrl	%cl, %ebp
	subl	%ecx, %esi
.L209:
	.loc 1 571 0
	cmpl	%ebx, %esi
	jae	.L199
.LBB20:
.LBB21:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L171
.LBB22:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L172
.L171:
.LBE22:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L172:
.LBE21:
.LBE20:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %ebp
	.loc 1 571 0
	addl	$8, %esi
	jmp	.L209
.L199:
	.loc 1 572 0
	movzwl	4(%edi), %eax
	movl	8(%esp), %edi
	subl	%eax, %edi
	movzwl	mask_bits(%ebx,%ebx), %eax
	andl	%ebp, %eax
	.loc 1 573 0
	movb	%bl, %cl
	.loc 1 572 0
	subl	%eax, %edi
	.loc 1 573 0
	shrl	%cl, %ebp
	subl	%ebx, %esi
.L175:
	.loc 1 578 0
	andl	$32767, %edi
	cmpl	8(%esp), %edi
	jbe	.L180
	movl	$32768, %ebx
	subl	%edi, %ebx
	jmp	.L181
.L180:
	movl	$32768, %ebx
	subl	8(%esp), %ebx
.L181:
	movl	12(%esp), %ecx
	cmpl	%ecx, %ebx
	ja	.L179
	movl	%ebx, %ecx
.L179:
	.loc 1 580 0
	movl	8(%esp), %eax
	subl	%edi, %eax
	.loc 1 578 0
	subl	%ecx, 12(%esp)
	.loc 1 580 0
	cmpl	%ecx, %eax
	.loc 1 578 0
	movl	%ecx, %ebx
	.loc 1 580 0
	jb	.L184
	.loc 1 582 0
	movl	8(%esp), %edx
	leal	window(%edi), %eax
	pushl	%ecx
.LCFI23:
	pushl	%eax
.LCFI24:
	addl	$window, %edx
	pushl	%edx
.LCFI25:
	call	memcpy
	.loc 1 584 0
	addl	%ebx, %edi
	.loc 1 583 0
	addl	%ebx, 20(%esp)
	.loc 1 584 0
	addl	$12, %esp
.LCFI26:
	jmp	.L183
.L184:
	.loc 1 589 0
	movl	%edi, %eax
	movl	8(%esp), %edx
	movb	window(%eax), %al
	incl	%edi
	movb	%al, window(%edx)
	incl	%edx
	.loc 1 591 0
	decl	%ebx
	.loc 1 589 0
	movl	%edx, 8(%esp)
	.loc 1 591 0
	jne	.L184
.L183:
	.loc 1 592 0
	cmpl	$32768, 8(%esp)
	jne	.L177
	.loc 1 594 0
	movl	$32768, outcnt
	call	flush_window
	.loc 1 595 0
	movl	$0, 8(%esp)
.L177:
	.loc 1 597 0
	cmpl	$0, 12(%esp)
	jne	.L175
	.loc 1 527 0
	jmp	.L211
.L124:
	.loc 1 603 0
	movl	8(%esp), %ecx
	movl	%ecx, outcnt
	.loc 1 604 0
	movl	%ebp, bb
	.loc 1 605 0
	movl	%esi, bk
	.loc 1 608 0
	xorl	%eax, %eax
.L122:
	.loc 1 609 0
	addl	$24, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.LFE13:
	.size	inflate_codes, .-inflate_codes
	.section	.rodata.str1.1
.LC5:
	.string	" incomplete literal tree"
.LC6:
	.string	" incomplete distance tree"
.LC7:
	.string	"invalid compressed format (err=1)"
.LC8:
	.string	"invalid compressed format (err=2)"
.LC9:
	.string	"invalid compressed format (other)"
	.text
	.p2align 2,,3
.globl gunzip
	.type	gunzip, @function
gunzip:
.LFB20:
	.loc 1 1059 0
	pushl	%ebp
.LCFI27:
	pushl	%edi
.LCFI28:
	pushl	%esi
.LCFI29:
	pushl	%ebx
.LCFI30:
	subl	$2480, %esp
.LCFI31:
.LBB23:
.LBB24:
	.loc 1 963 0
	movl	$0, 20(%esp)
	.loc 1 957 0
	movl	$0, outcnt
	.loc 1 958 0
	movl	$0, bk
	.loc 1 959 0
	movl	$0, bb
.L215:
.LBB25:
.LBB26:
	.loc 1 913 0
	movl	bk, %ebx
.LBE26:
.LBE25:
.LBB27:
.LBB28:
	.loc 2 130 0
	movl	free_mem_ptr, %eax
.LBE28:
.LBE27:
.LBB29:
.LBB30:
	.loc 1 917 0
	testl	%ebx, %ebx
.LBE30:
.LBE29:
	.loc 1 965 0
	movl	$0, hufts
.LBB31:
.LBB32:
	.loc 2 130 0
	movl	%eax, 24(%esp)
.LBE32:
.LBE31:
.LBB33:
.LBB34:
	.loc 1 912 0
	movl	bb, %esi
	.loc 1 917 0
	jne	.L385
.LBB35:
.LBB36:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L441
.LBB37:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L442
.L441:
.LBE37:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L442:
.LBE36:
.LBE35:
	.loc 2 77 0
	orl	%eax, %esi
	.loc 1 917 0
	movl	$8, %ebx
.L385:
	.loc 1 918 0
	movl	%esi, %eax
	andl	$1, %eax
	movl	%eax, 60(%esp)
	.loc 1 919 0
	shrl	%esi
	decl	%ebx
.L446:
	.loc 1 923 0
	cmpl	$1, %ebx
	ja	.L387
.LBB38:
.LBB39:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L228
.LBB40:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L229
.L228:
.LBE40:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L229:
.LBE39:
.LBE38:
	.loc 2 77 0
	movb	%bl, %cl
	sall	%cl, %eax
	orl	%eax, %esi
	.loc 1 923 0
	addl	$8, %ebx
	jmp	.L446
.L387:
	.loc 1 924 0
	movl	%esi, %eax
	andl	$3, %eax
	.loc 1 925 0
	shrl	$2, %esi
	subl	$2, %ebx
	.loc 1 933 0
	cmpl	$2, %eax
	.loc 1 929 0
	movl	%esi, bb
	.loc 1 930 0
	movl	%ebx, bk
	.loc 1 933 0
	jne	.L232
.LBB41:
.LBB42:
	.loc 1 749 0
	movl	%esi, %edi
	.loc 1 750 0
	movl	%ebx, %esi
.L447:
	.loc 1 754 0
	cmpl	$4, %esi
	ja	.L389
.LBB43:
.LBB44:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L235
.LBB45:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L236
.L235:
.LBE45:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L236:
.LBE44:
.LBE43:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %edi
	.loc 1 754 0
	addl	$8, %esi
	jmp	.L447
.L389:
	.loc 1 755 0
	movl	%edi, %eax
	andl	$31, %eax
	addl	$257, %eax
	movl	%eax, 4(%esp)
	.loc 1 756 0
	shrl	$5, %edi
	subl	$5, %esi
.L448:
	.loc 1 757 0
	cmpl	$4, %esi
	ja	.L391
.LBB46:
.LBB47:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L241
.LBB48:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L242
.L241:
.LBE48:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L242:
.LBE47:
.LBE46:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %edi
	.loc 1 757 0
	addl	$8, %esi
	jmp	.L448
.L391:
	.loc 1 758 0
	movl	%edi, %eax
	andl	$31, %eax
	incl	%eax
	movl	%eax, (%esp)
	.loc 1 759 0
	shrl	$5, %edi
	subl	$5, %esi
.L449:
	.loc 1 760 0
	cmpl	$3, %esi
	ja	.L393
.LBB49:
.LBB50:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L247
.LBB51:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L248
.L247:
.LBE51:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L248:
.LBE50:
.LBE49:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %edi
	.loc 1 760 0
	addl	$8, %esi
	jmp	.L449
.L393:
	.loc 1 761 0
	movl	%edi, %eax
	andl	$15, %eax
	.loc 1 762 0
	shrl	$4, %edi
	subl	$4, %esi
	.loc 1 766 0
	cmpl	$286, 4(%esp)
	.loc 1 761 0
	leal	4(%eax), %ebp
	.loc 1 766 0
	ja	.L438
	cmpl	$30, (%esp)
	ja	.L438
	.loc 1 773 0
	xorl	%ebx, %ebx
	cmpl	%ebp, %ebx
	jae	.L267
.L467:
	.loc 1 775 0
	cmpl	$2, %esi
	ja	.L397
.LBB52:
.LBB53:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L259
.LBB54:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L260
.L259:
.LBE54:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L260:
.LBE53:
.LBE52:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %edi
	.loc 1 775 0
	addl	$8, %esi
	jmp	.L467
.L397:
	.loc 1 776 0
	movl	border(,%ebx,4), %edx
	movl	%edi, %eax
	.loc 1 773 0
	incl	%ebx
	.loc 1 776 0
	andl	$7, %eax
	.loc 1 777 0
	shrl	$3, %edi
	subl	$3, %esi
	.loc 1 773 0
	cmpl	%ebp, %ebx
	.loc 1 776 0
	movl	%eax, 1216(%esp,%edx,4)
	.loc 1 773 0
	jb	.L467
.L450:
	.loc 1 779 0
	cmpl	$18, %ebx
	ja	.L399
.L267:
	.loc 1 780 0
	movl	border(,%ebx,4), %eax
	.loc 1 779 0
	incl	%ebx
	.loc 1 780 0
	movl	$0, 1216(%esp,%eax,4)
	jmp	.L450
.L399:
	.loc 1 786 0
	leal	56(%esp), %eax
	.loc 1 785 0
	movl	$7, 56(%esp)
	.loc 1 786 0
	pushl	%eax
.LCFI32:
	leal	56(%esp), %edx
	pushl	%edx
.LCFI33:
	pushl	$0
.LCFI34:
	pushl	$0
.LCFI35:
	pushl	$19
.LCFI36:
	leal	1236(%esp), %eax
	movl	$19, %edx
	call	huft_build
	addl	$20, %esp
.LCFI37:
	testl	%eax, %eax
	movl	%eax, %ebp
	je	.L268
	.loc 1 788 0
	cmpl	$1, %eax
	jne	.L458
	jmp	.L318
.L268:
	.loc 1 796 0
	movl	4(%esp), %ecx
	.loc 1 797 0
	movl	56(%esp), %eax
	.loc 1 796 0
	addl	(%esp), %ecx
	.loc 1 797 0
	movzwl	mask_bits(%eax,%eax), %eax
	.loc 1 796 0
	movl	%ecx, 8(%esp)
	.loc 1 797 0
	movl	%eax, 12(%esp)
	.loc 1 798 0
	movl	$0, 16(%esp)
	.loc 1 837 0
	cmpl	%ecx, %ebp
.L451:
	jae	.L401
.L452:
	.loc 1 801 0
	cmpl	56(%esp), %esi
	jae	.L403
.LBB55:
.LBB56:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L274
.LBB57:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L275
.L274:
.LBE57:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L275:
.LBE56:
.LBE55:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %edi
	.loc 1 801 0
	addl	$8, %esi
	jmp	.L452
.L403:
	.loc 1 802 0
	movl	12(%esp), %edx
	andl	%edi, %edx
	movl	52(%esp), %eax
	leal	(%eax,%edx,8), %edx
	movl	%edx, 44(%esp)
	movzbl	1(%edx), %ebx
	.loc 1 803 0
	movb	%bl, %cl
	subl	%ebx, %esi
	.loc 1 804 0
	movzwl	4(%edx), %ebx
	.loc 1 803 0
	shrl	%cl, %edi
	.loc 1 805 0
	cmpl	$15, %ebx
	ja	.L278
	.loc 1 806 0
	movl	%ebx, 1216(%esp,%ebp,4)
	incl	%ebp
	movl	%ebx, 16(%esp)
	jmp	.L270
.L278:
	.loc 1 807 0
	cmpl	$16, %ebx
	jne	.L280
.L453:
	.loc 1 809 0
	cmpl	$1, %esi
	ja	.L405
.LBB58:
.LBB59:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L283
.LBB60:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L284
.L283:
.LBE60:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L284:
.LBE59:
.LBE58:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %edi
	.loc 1 809 0
	addl	$8, %esi
	jmp	.L453
.L405:
	.loc 1 810 0
	movl	%edi, %edx
	andl	$3, %edx
	.loc 1 812 0
	leal	3(%edx,%ebp), %eax
	.loc 1 811 0
	shrl	$2, %edi
	subl	$2, %esi
	.loc 1 812 0
	cmpl	8(%esp), %eax
	ja	.L438
	.loc 1 815 0
	leal	2(%edx), %ebx
.L454:
	cmpl	$-1, %ebx
	je	.L270
	movl	16(%esp), %eax
	movl	%eax, 1216(%esp,%ebp,4)
	decl	%ebx
	incl	%ebp
	jmp	.L454
.L280:
	.loc 1 817 0
	cmpl	$17, %ebx
	jne	.L292
.L455:
	.loc 1 819 0
	cmpl	$2, %esi
	ja	.L409
.LBB61:
.LBB62:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L295
.LBB63:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L296
.L295:
.LBE63:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L296:
.LBE62:
.LBE61:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %edi
	.loc 1 819 0
	addl	$8, %esi
	jmp	.L455
.L409:
	.loc 1 820 0
	movl	%edi, %edx
	andl	$7, %edx
	.loc 1 822 0
	leal	3(%edx,%ebp), %eax
	.loc 1 821 0
	shrl	$3, %edi
	subl	$3, %esi
	.loc 1 822 0
	cmpl	8(%esp), %eax
	ja	.L438
	.loc 1 825 0
	leal	2(%edx), %ebx
.L456:
	cmpl	$-1, %ebx
	je	.L415
	movl	$0, 1216(%esp,%ebp,4)
	decl	%ebx
	incl	%ebp
	jmp	.L456
.L292:
	.loc 1 830 0
	cmpl	$6, %esi
	ja	.L413
.LBB64:
.LBB65:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L306
.LBB66:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L307
.L306:
.LBE66:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L307:
.LBE65:
.LBE64:
	.loc 2 77 0
	movl	%esi, %ecx
	sall	%cl, %eax
	orl	%eax, %edi
	.loc 1 830 0
	addl	$8, %esi
	jmp	.L292
.L413:
	.loc 1 831 0
	movl	%edi, %edx
	andl	$127, %edx
	.loc 1 833 0
	leal	11(%edx,%ebp), %eax
	.loc 1 832 0
	shrl	$7, %edi
	subl	$7, %esi
	.loc 1 833 0
	cmpl	8(%esp), %eax
	ja	.L438
	.loc 1 836 0
	leal	10(%edx), %ebx
.L457:
	cmpl	$-1, %ebx
	je	.L415
	movl	$0, 1216(%esp,%ebp,4)
	decl	%ebx
	incl	%ebp
	jmp	.L457
.L415:
	.loc 1 837 0
	movl	$0, 16(%esp)
.L270:
	cmpl	8(%esp), %ebp
	jmp	.L451
.L401:
	.loc 1 844 0
	movl	52(%esp), %eax
	call	huft_free
	.loc 1 856 0
	leal	56(%esp), %eax
	.loc 1 855 0
	movl	$9, 56(%esp)
	.loc 1 856 0
	leal	1216(%esp), %ebx
	pushl	%eax
.LCFI38:
	leal	56(%esp), %edx
	pushl	%edx
.LCFI39:
	pushl	$cplext
.LCFI40:
	pushl	$cplens
.LCFI41:
	pushl	$257
.LCFI42:
	movl	24(%esp), %edx
	movl	%ebx, %eax
	.loc 1 849 0
	movl	%edi, bb
	.loc 1 850 0
	movl	%esi, bk
	.loc 1 856 0
	call	huft_build
	addl	$20, %esp
.LCFI43:
	testl	%eax, %eax
	movl	%eax, %ebp
	je	.L315
	.loc 1 859 0
	cmpl	$1, %eax
	jne	.L458
	.loc 1 860 0
	movl	$.LC5, %eax
	call	error
	jmp	.L318
.L315:
	.loc 1 867 0
	leal	48(%esp), %edx
	movl	4(%esp), %ecx
	.loc 1 866 0
	movl	$6, 48(%esp)
	.loc 1 867 0
	pushl	%edx
.LCFI44:
	leal	48(%esp), %edx
	pushl	%edx
.LCFI45:
	pushl	$cpdext
.LCFI46:
	pushl	$cpdist
.LCFI47:
	pushl	$0
.LCFI48:
	movl	20(%esp), %edx
	leal	(%ebx,%ecx,4), %eax
	call	huft_build
	addl	$20, %esp
.LCFI49:
	testl	%eax, %eax
	movl	%eax, %ebp
	je	.L317
	.loc 1 870 0
	cmpl	$1, %eax
	jne	.L318
	.loc 1 871 0
	movl	$.LC6, %eax
	call	error
	.loc 1 876 0
	movl	44(%esp), %eax
	call	huft_free
.L318:
	.loc 1 878 0
	movl	52(%esp), %eax
	call	huft_free
.L458:
	movl	%ebp, %edx
	jmp	.L364
.L317:
	.loc 1 886 0
	movl	44(%esp), %edx
	movl	52(%esp), %eax
	pushl	48(%esp)
.LCFI50:
	pushl	60(%esp)
.LCFI51:
	call	inflate_codes
	testl	%eax, %eax
	popl	%ebx
.LCFI52:
	popl	%esi
.LCFI53:
	movl	$1, %edx
	jne	.L364
	jmp	.L319
.L438:
	.loc 1 833 0
	movl	$1, %edx
	jmp	.L364
.L319:
	.loc 1 892 0
	movl	52(%esp), %eax
	call	huft_free
	.loc 1 893 0
	movl	44(%esp), %eax
	jmp	.L465
.L232:
.LBE42:
.LBE41:
	.loc 1 935 0
	testl	%eax, %eax
	jne	.L321
.LBB67:
.LBB68:
	.loc 1 630 0
	movl	%ebx, %edi
	andl	$7, %edi
	.loc 1 631 0
	movl	%edi, %ecx
	.loc 1 626 0
	movl	outcnt, %ebp
	.loc 1 631 0
	shrl	%cl, %esi
	subl	%edi, %ebx
.L459:
	.loc 1 635 0
	cmpl	$15, %ebx
	ja	.L417
.LBB69:
.LBB70:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L324
.LBB71:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L325
.L324:
.LBE71:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L325:
.LBE70:
.LBE69:
	.loc 2 77 0
	movb	%bl, %cl
	sall	%cl, %eax
	orl	%eax, %esi
	.loc 1 635 0
	addl	$8, %ebx
	jmp	.L459
.L417:
	.loc 1 636 0
	movl	%esi, %edi
	andl	$65535, %edi
	.loc 1 637 0
	shrl	$16, %esi
	subl	$16, %ebx
.L460:
	.loc 1 638 0
	cmpl	$15, %ebx
	ja	.L419
.LBB72:
.LBB73:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L330
.LBB74:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L331
.L330:
.LBE74:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L331:
.LBE73:
.LBE72:
	.loc 2 77 0
	movb	%bl, %cl
	sall	%cl, %eax
	orl	%eax, %esi
	.loc 1 638 0
	addl	$8, %ebx
	jmp	.L460
.L419:
	.loc 1 639 0
	movl	%esi, %eax
	notl	%eax
	andl	$65535, %eax
	cmpl	%eax, %edi
	movl	$1, %edx
	jne	.L364
	.loc 1 641 0
	shrl	$16, %esi
	subl	$16, %ebx
.L461:
	.loc 1 654 0
	decl	%edi
	cmpl	$-1, %edi
	je	.L421
.L462:
	.loc 1 647 0
	cmpl	$7, %ebx
	ja	.L423
.LBB75:
.LBB76:
	.loc 2 78 0
	movl	inbytes, %ecx
	testl	%ecx, %ecx
	je	.L340
.LBB77:
	.loc 2 79 0
	movl	inbuf, %edx
	leal	1(%edx), %eax
	movl	%eax, inbuf
	movb	(%edx), %dl
	.loc 2 80 0
	leal	-1(%ecx), %eax
	movl	%eax, inbytes
	movzbl	%dl, %eax
	jmp	.L341
.L340:
.LBE77:
	.loc 2 83 0
	call	fill_inbuf
	movzbl	%al, %eax
.L341:
.LBE76:
.LBE75:
	.loc 2 77 0
	movb	%bl, %cl
	sall	%cl, %eax
	orl	%eax, %esi
	.loc 1 647 0
	addl	$8, %ebx
	jmp	.L462
.L423:
	.loc 1 648 0
	movl	%esi, %eax
	movb	%al, window(%ebp)
	incl	%ebp
	.loc 1 649 0
	cmpl	$32768, %ebp
	jne	.L344
	.loc 1 651 0
	movl	$32768, outcnt
	.loc 1 652 0
	xorw	%bp, %bp
	.loc 1 651 0
	call	flush_window
.L344:
	.loc 1 654 0
	shrl	$8, %esi
	subl	$8, %ebx
	jmp	.L461
.L421:
	.loc 1 659 0
	movl	%ebp, outcnt
	.loc 1 660 0
	movl	%esi, bb
	.loc 1 661 0
	movl	%ebx, bk
	jmp	.L466
.L321:
.LBE68:
.LBE67:
	.loc 1 937 0
	decl	%eax
	jne	.L346
.LBB78:
.LBB79:
	.loc 1 684 0
	xorl	%ebx, %ebx
.L350:
	.loc 1 685 0
	movl	$8, 64(%esp,%ebx,4)
	.loc 1 684 0
	incl	%ebx
	cmpl	$143, %ebx
	jle	.L350
	movl	$144, %ebx
.L354:
	.loc 1 687 0
	movl	$9, 64(%esp,%ebx,4)
	.loc 1 686 0
	incl	%ebx
	cmpl	$255, %ebx
	jle	.L354
.L463:
	.loc 1 688 0
	cmpl	$279, %ebx
	jg	.L429
	.loc 1 689 0
	movl	$7, 64(%esp,%ebx,4)
	.loc 1 688 0
	incl	%ebx
	jmp	.L463
.L429:
	.loc 1 690 0
	cmpl	$287, %ebx
	jg	.L431
	.loc 1 691 0
	movl	$8, 64(%esp,%ebx,4)
	.loc 1 690 0
	incl	%ebx
	jmp	.L429
.L431:
	.loc 1 693 0
	leal	40(%esp), %eax
	.loc 1 692 0
	movl	$7, 40(%esp)
	.loc 1 693 0
	pushl	%eax
.LCFI54:
	leal	40(%esp), %eax
	pushl	%eax
.LCFI55:
	pushl	$cplext
.LCFI56:
	pushl	$cplens
.LCFI57:
	pushl	$257
.LCFI58:
	movl	$288, %edx
	leal	84(%esp), %eax
	call	huft_build
	addl	$20, %esp
.LCFI59:
	testl	%eax, %eax
	movl	%eax, %ebx
	movl	%eax, %edx
	jne	.L364
.L368:
	.loc 1 699 0
	movl	$5, 64(%esp,%ebx,4)
	.loc 1 698 0
	incl	%ebx
	cmpl	$29, %ebx
	jle	.L368
	.loc 1 701 0
	leal	32(%esp), %eax
	.loc 1 700 0
	movl	$5, 32(%esp)
	.loc 1 701 0
	pushl	%eax
.LCFI60:
	leal	32(%esp), %eax
	pushl	%eax
.LCFI61:
	pushl	$cpdext
.LCFI62:
	pushl	$cpdist
.LCFI63:
	pushl	$0
.LCFI64:
	leal	84(%esp), %eax
	movl	$30, %edx
	call	huft_build
	addl	$20, %esp
.LCFI65:
	cmpl	$1, %eax
	movl	%eax, %ebx
	movl	36(%esp), %eax
	jle	.L369
	.loc 1 703 0
	call	huft_free
	movl	%ebx, %edx
	jmp	.L364
.L369:
	.loc 1 711 0
	movl	28(%esp), %edx
	pushl	32(%esp)
.LCFI66:
	pushl	44(%esp)
.LCFI67:
	call	inflate_codes
	testl	%eax, %eax
	popl	%edx
.LCFI68:
	popl	%ecx
.LCFI69:
	movl	$1, %edx
	jne	.L364
	.loc 1 716 0
	movl	36(%esp), %eax
	call	huft_free
	.loc 1 717 0
	movl	28(%esp), %eax
.L465:
	call	huft_free
.L466:
	xorl	%edx, %edx
	jmp	.L364
.L346:
.LBE79:
.LBE78:
	.loc 1 937 0
	movl	$2, %ebx
	jmp	.L439
.L364:
.LBE34:
.LBE33:
	.loc 1 904 0
	testl	%edx, %edx
.LBB80:
.LBB81:
	.loc 1 673 0
	movl	%edx, %ebx
.LBE81:
.LBE80:
	.loc 1 904 0
	jne	.L439
	.loc 1 971 0
	leal	24(%esp), %eax
	call	gzip_release
	.loc 1 972 0
	movl	hufts, %eax
	cmpl	20(%esp), %eax
	jbe	.L217
	.loc 1 973 0
	movl	%eax, 20(%esp)
.L217:
	.loc 1 974 0
	cmpl	$0, 60(%esp)
	je	.L215
	.loc 2 91 0
	movl	bk, %eax
	cmpl	$7, %eax
	jbe	.L435
	movl	inbytes, %ebx
	movl	inbuf, %ecx
.L376:
	.loc 1 980 0
	leal	-8(%eax), %edx
.LBB82:
.LBB83:
	.loc 2 90 0
	incl	%ebx
	.loc 2 91 0
	decl	%ecx
.LBE83:
.LBE82:
	cmpl	$7, %edx
	movl	%edx, %eax
	ja	.L376
	movl	%ecx, inbuf
	movl	%ebx, inbytes
	movl	%edx, bk
.L435:
	.loc 1 985 0
	call	flush_window
	jmp	.L214
.L439:
	.loc 1 968 0
	leal	24(%esp), %eax
	call	gzip_release
.LBE24:
.LBE23:
	.loc 1 950 0
	testl	%ebx, %ebx
	je	.L214
	.loc 1 1064 0
	cmpl	$1, %ebx
	je	.L379
	jg	.L383
	testl	%ebx, %ebx
	je	.L377
	jmp	.L382
.L383:
	cmpl	$2, %ebx
	je	.L380
	cmpl	$3, %ebx
	je	.L381
	jmp	.L382
.L379:
	.loc 1 1068 0
	movl	$.LC7, %eax
	jmp	.L464
.L380:
	.loc 1 1071 0
	movl	$.LC8, %eax
	jmp	.L464
.L381:
	.loc 1 1074 0
	movl	$.LC2, %eax
	jmp	.L464
.L382:
	.loc 1 1077 0
	movl	$.LC9, %eax
.L464:
	call	error
.L377:
	.loc 1 1079 0
	orl	$-1, %eax
	jmp	.L213
.L214:
	.loc 1 1082 0
	xorl	%eax, %eax
.L213:
	.loc 1 1083 0
	addl	$2480, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.LFE20:
	.size	gunzip, .-gunzip
	.section	.rodata.str1.1
.LC10:
	.string	"gzip file uses invalid method"
.LC11:
	.string	"gzip file is encrypted; not supported"
.LC12:
	.string	"gzip file is a continuation file; not supported"
.LC13:
	.string	"gzip file has unsupported flags"
.LC14:
	.string	"gzip file corrupt"
.LC15:
	.string	"pkzip file is encrypted; not supported"
.LC16:
	.string	"pkzip file uses data_descriptor field; not supported"
.LC17:
	.string	"pkzip file has unsupported flags"
.LC18:
	.string	"pkzip file uses invalid method"
.LC19:
	.string	"pkzip file corrupt"
	.text
	.p2align 2,,3
.globl check_zip
	.type	check_zip, @function
check_zip:
.LFB28:
	.loc 2 239 0
	pushl	%ebp
.LCFI70:
	pushl	%edi
.LCFI71:
	pushl	%esi
.LCFI72:
	pushl	%ebx
.LCFI73:
	.loc 2 239 0
	movl	20(%esp), %ebx
	.loc 2 244 0
	cmpw	$-29921, (%ebx)
	.loc 2 239 0
	movl	24(%esp), %esi
	movl	28(%esp), %ebp
	.loc 2 244 0
	jne	.L469
.LBB84:
	.loc 2 247 0
	cmpb	$8, 2(%ebx)
	.loc 2 245 0
	leal	-8(%ebx,%esi), %edi
	.loc 2 248 0
	movl	$.LC10, %eax
	.loc 2 247 0
	jne	.L498
	.loc 2 251 0
	movb	3(%ebx), %cl
	movzbl	%cl, %eax
	testb	$32, %al
	je	.L471
	.loc 2 252 0
	movl	$.LC11, %eax
	jmp	.L498
.L471:
	.loc 2 255 0
	testb	$2, %al
	je	.L472
	.loc 2 256 0
	movl	$.LC12, %eax
	jmp	.L498
.L472:
	.loc 2 259 0
	testb	$-64, %cl
	je	.L473
	.loc 2 260 0
	movl	$.LC13, %eax
	jmp	.L498
.L473:
	.loc 2 264 0
	testb	$4, %al
	.loc 2 263 0
	movl	$10, %edx
	.loc 2 264 0
	je	.L474
.LBB85:
	.loc 2 267 0
	movl	10(%ebx), %edx
	addl	$12, %edx
.L474:
.LBE85:
	.loc 2 269 0
	testb	$8, %al
	je	.L475
	jmp	.L495
.L494:
.LBB86:
	.loc 2 273 0
	cmpl	%esi, %edx
	jae	.L477
	incl	%edx
.L495:
	cmpb	$0, (%ebx,%edx)
	jne	.L494
.L477:
	.loc 2 275 0
	incl	%edx
.L475:
.LBE86:
	.loc 2 278 0
	andb	$16, %cl
	je	.L479
	jmp	.L497
.L496:
.LBB87:
	.loc 2 282 0
	cmpl	%esi, %edx
	jae	.L481
	incl	%edx
.L497:
	cmpb	$0, (%ebx,%edx)
	jne	.L496
.L481:
	.loc 2 284 0
	incl	%edx
.L479:
.LBE87:
	.loc 2 287 0
	cmpl	%esi, %edx
	.loc 2 288 0
	movl	$.LC14, %eax
	.loc 2 287 0
	ja	.L498
	.loc 2 291 0
	subl	%edx, %esi
	leal	-8(%esi), %eax
	movl	%eax, (%ebp)
	.loc 2 292 0
	movl	4(%edi), %eax
	movl	32(%esp), %ecx
	movl	%eax, (%ecx)
	.loc 2 293 0
	movl	(%edi), %eax
	jmp	.L499
.L469:
.LBE84:
	.loc 2 339 0
	orl	$-1, %eax
	.loc 2 297 0
	cmpl	$67324752, (%ebx)
	jne	.L468
	.loc 2 301 0
	movw	6(%ebx), %dx
	movzwl	%dx, %eax
	testb	$1, %al
	je	.L486
	.loc 2 302 0
	movl	$.LC15, %eax
	jmp	.L498
.L486:
	.loc 2 305 0
	testb	$8, %al
	je	.L487
	.loc 2 306 0
	movl	$.LC16, %eax
	jmp	.L498
.L487:
	.loc 2 309 0
	testw	$-16, %dx
	.loc 2 310 0
	movl	$.LC17, %eax
	.loc 2 309 0
	jne	.L498
	.loc 2 315 0
	cmpw	$8, 8(%ebx)
	.loc 2 316 0
	movl	$.LC18, %eax
	.loc 2 315 0
	jne	.L498
	.loc 2 322 0
	movzwl	26(%ebx), %eax
	.loc 2 324 0
	movzwl	28(%ebx), %edx
	leal	30(%eax,%edx), %edx
	.loc 2 326 0
	movl	18(%ebx), %ecx
	leal	(%edx,%ecx), %eax
	cmpl	%esi, %eax
	jbe	.L490
	.loc 2 327 0
	movl	$.LC19, %eax
.L498:
	call	error
	.loc 2 328 0
	orl	$-1, %eax
	jmp	.L468
.L490:
	.loc 2 331 0
	movl	%ecx, (%ebp)
	.loc 2 332 0
	movl	22(%ebx), %eax
	movl	32(%esp), %ecx
	movl	%eax, (%ecx)
	.loc 2 333 0
	movl	14(%ebx), %eax
.L499:
	movl	36(%esp), %ecx
	movl	%eax, (%ecx)
	.loc 2 334 0
	movl	40(%esp), %eax
	movl	%edx, (%eax)
	.loc 2 335 0
	xorl	%eax, %eax
.L468:
	.loc 2 344 0
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.LFE28:
	.size	check_zip, .-check_zip
	.section	.rodata
	.align 32
	.type	p.0, @object
	.size	p.0, 56
p.0:
	.long	0
	.long	1
	.long	2
	.long	4
	.long	5
	.long	7
	.long	8
	.long	10
	.long	11
	.long	12
	.long	16
	.long	22
	.long	23
	.long	26
	.section	.rodata.str1.1
.LC21:
	.string	"compressed data length error"
.LC22:
	.string	"uncompressed data length error"
.LC23:
	.string	"crc error"
.LC24:
	.string	"ok\n"
	.text
	.p2align 2,,3
.globl unzip
	.type	unzip, @function
unzip:
.LFB29:
	.loc 2 355 0
	pushl	%ebp
.LCFI74:
	pushl	%edi
.LCFI75:
	pushl	%esi
.LCFI76:
	.loc 2 357 0
	movl	sys_bounce, %eax
	.loc 2 355 0
	pushl	%ebx
.LCFI77:
	.loc 2 357 0
	leal	65536(%eax), %edx
	.loc 2 358 0
	addl	$131072, %eax
	movl	%eax, free_mem_end_ptr
	.loc 2 361 0
	movl	20(%esp), %eax
	movl	%eax, inbuf
	.loc 2 365 0
	movl	24(%esp), %eax
	addl	$4, %eax
	.loc 2 355 0
	movl	28(%esp), %ebp
	movl	36(%esp), %edi
	.loc 2 357 0
	movl	%edx, free_mem_ptr
	.loc 2 365 0
	movl	%eax, inbytes
	movl	%eax, insize
	.loc 2 368 0
	movl	$0, outcnt
	.loc 2 369 0
	movl	%edi, output_data
	.loc 2 370 0
	movl	%ebp, output_size
	.loc 2 371 0
	movl	$0, bytes_out
.LBB88:
.LBB89:
	.loc 1 1024 0
	xorl	%esi, %esi
	.loc 1 1025 0
	xorl	%ebx, %ebx
.L504:
	.loc 1 1026 0
	movl	$31, %ecx
	subl	p.0(,%ebx,4), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	.loc 1 1025 0
	incl	%ebx
	.loc 1 1026 0
	orl	%eax, %esi
	.loc 1 1025 0
	cmpl	$13, %ebx
	jbe	.L504
	.loc 1 1028 0
	movl	$0, crc_32_tab
	.loc 1 1030 0
	movl	$1, %ebx
.L514:
	.loc 1 1033 0
	movl	%ebx, %edx
	.loc 1 1032 0
	xorl	%ecx, %ecx
	.loc 1 1033 0
	orb	$1, %dh
.L525:
	cmpl	$1, %edx
	je	.L524
	.loc 1 1035 0
	movl	%ecx, %eax
	shrl	%eax
	andb	$1, %cl
	je	.L511
	xorl	%esi, %eax
.L511:
	.loc 1 1036 0
	testb	$1, %dl
	.loc 1 1035 0
	movl	%eax, %ecx
	.loc 1 1036 0
	je	.L510
	.loc 1 1037 0
	xorl	%esi, %ecx
.L510:
	.loc 1 1033 0
	sarl	%edx
	jmp	.L525
.L524:
	.loc 1 1039 0
	movl	%ecx, crc_32_tab(,%ebx,4)
	.loc 1 1030 0
	incl	%ebx
	cmpl	$255, %ebx
	jle	.L514
	.loc 1 1043 0
	movl	$-1, crc
.LBE89:
.LBE88:
	.loc 2 374 0
	call	gunzip
	.loc 2 377 0
	cmpl	$4, inbytes
	je	.L516
	.loc 2 378 0
	movl	$.LC21, %eax
	call	error
.L516:
	.loc 2 381 0
	cmpl	%ebp, bytes_out
	je	.L517
	.loc 2 382 0
	movl	$.LC22, %eax
	call	error
.L517:
	.loc 2 384 0
	movl	crc, %eax
	notl	%eax
	cmpl	%eax, 32(%esp)
	je	.L518
	.loc 2 385 0
	movl	$.LC23, %eax
	call	error
.L518:
	.loc 2 387 0
	pushl	$.LC24
.LCFI78:
	call	puts
	.loc 2 389 0
	popl	%ebp
.LCFI79:
	.loc 2 390 0
	popl	%ebx
	popl	%esi
	movl	%edi, %eax
	popl	%edi
	popl	%ebp
	ret
.LFE29:
	.size	unzip, .-unzip
	.local	inbuf
	.comm	inbuf,4,4
	.local	window
	.comm	window,32768,32
	.local	insize
	.comm	insize,4,4
	.local	inbytes
	.comm	inbytes,4,4
	.local	outcnt
	.comm	outcnt,4,4
	.local	crc_32_tab
	.comm	crc_32_tab,1024,32
	.local	output_data
	.comm	output_data,4,4
	.local	output_size
	.comm	output_size,4,4
	.local	free_mem_ptr
	.comm	free_mem_ptr,4,4
	.local	free_mem_end_ptr
	.comm	free_mem_end_ptr,4,4
	.local	bb
	.comm	bb,4,4
	.local	bk
	.comm	bk,4,4
	.local	hufts
	.comm	hufts,4,4
	.local	crc
	.comm	crc,4,4
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
	.long	.LFB12
	.long	.LFE12-.LFB12
	.align 4
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB24
	.long	.LFE24-.LFB24
	.align 4
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB27
	.long	.LFE27-.LFB27
	.byte	0x4
	.long	.LCFI0-.LFB27
	.byte	0xe
	.uleb128 0x8
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0xc
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x4
	.align 4
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB11
	.long	.LFE11-.LFB11
	.byte	0x4
	.long	.LCFI4-.LFB11
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x5b0
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x5b4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x5b8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x5bc
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x5b0
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB26
	.long	.LFE26-.LFB26
	.byte	0x4
	.long	.LCFI13-.LFB26
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0xc
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.align 4
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB25
	.long	.LFE25-.LFB25
	.byte	0x4
	.long	.LCFI15-.LFB25
	.byte	0xe
	.uleb128 0x8
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI16-.LCFI15
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x4
	.align 4
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB13
	.long	.LFE13-.LFB13
	.byte	0x4
	.long	.LCFI18-.LFB13
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x2c
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0x30
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x34
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x38
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x2c
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB20
	.long	.LFE20-.LFB20
	.byte	0x4
	.long	.LCFI27-.LFB20
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI29-.LCFI28
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x9c4
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI32-.LCFI31
	.byte	0xe
	.uleb128 0x9c8
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x9cc
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x9d0
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI35-.LCFI34
	.byte	0xe
	.uleb128 0x9d4
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x9d8
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x9c4
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0x9c8
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0x9cc
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x9d0
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0x9d4
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x9d8
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0x9c4
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI44-.LCFI43
	.byte	0xe
	.uleb128 0x9c8
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0x9cc
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0x9d0
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI47-.LCFI46
	.byte	0xe
	.uleb128 0x9d4
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0x9d8
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0x9c4
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI50-.LCFI49
	.byte	0xe
	.uleb128 0x9c8
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI51-.LCFI50
	.byte	0xe
	.uleb128 0x9cc
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI52-.LCFI51
	.byte	0xe
	.uleb128 0x9c8
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI53-.LCFI52
	.byte	0xe
	.uleb128 0x9c4
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0x9c8
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI55-.LCFI54
	.byte	0xe
	.uleb128 0x9cc
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0x9d0
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0x9d4
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI58-.LCFI57
	.byte	0xe
	.uleb128 0x9d8
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI59-.LCFI58
	.byte	0xe
	.uleb128 0x9c4
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI60-.LCFI59
	.byte	0xe
	.uleb128 0x9c8
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI61-.LCFI60
	.byte	0xe
	.uleb128 0x9cc
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI62-.LCFI61
	.byte	0xe
	.uleb128 0x9d0
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI63-.LCFI62
	.byte	0xe
	.uleb128 0x9d4
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI64-.LCFI63
	.byte	0xe
	.uleb128 0x9d8
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI65-.LCFI64
	.byte	0xe
	.uleb128 0x9c4
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI66-.LCFI65
	.byte	0xe
	.uleb128 0x9c8
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI67-.LCFI66
	.byte	0xe
	.uleb128 0x9cc
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI68-.LCFI67
	.byte	0xe
	.uleb128 0x9c8
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI69-.LCFI68
	.byte	0xe
	.uleb128 0x9c4
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE14:
.LSFDE16:
	.long	.LEFDE16-.LASFDE16
.LASFDE16:
	.long	.Lframe0
	.long	.LFB28
	.long	.LFE28-.LFB28
	.byte	0x4
	.long	.LCFI70-.LFB28
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI71-.LCFI70
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI72-.LCFI71
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI73-.LCFI72
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
.LEFDE16:
.LSFDE18:
	.long	.LEFDE18-.LASFDE18
.LASFDE18:
	.long	.Lframe0
	.long	.LFB29
	.long	.LFE29-.LFB29
	.byte	0x4
	.long	.LCFI74-.LFB29
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI75-.LCFI74
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI76-.LCFI75
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI77-.LCFI76
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI78-.LCFI77
	.byte	0xe
	.uleb128 0x18
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI79-.LCFI78
	.byte	0xe
	.uleb128 0x14
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE18:
	.file 3 "../com32/include/stdint.h"
	.file 4 "../com32/include/com32.h"
	.file 5 "memdisk.h"
	.text
.Letext0:
	.section	.debug_info
	.long	0x1349
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.Ldebug_line0
	.long	.Letext0
	.long	.Ltext0
	.long	.LASF91
	.byte	0x1
	.long	.LASF92
	.long	.LASF93
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
	.uleb128 0x2
	.long	.LASF9
	.byte	0x8
	.byte	0x7
	.uleb128 0x5
	.long	0xa2
	.byte	0x4
	.byte	0x4
	.byte	0x1f
	.uleb128 0x6
	.string	"l"
	.byte	0x4
	.byte	0x1c
	.long	0x65
	.uleb128 0x6
	.string	"w"
	.byte	0x4
	.byte	0x1d
	.long	0xa2
	.uleb128 0x6
	.string	"b"
	.byte	0x4
	.byte	0x1e
	.long	0xb9
	.byte	0x0
	.uleb128 0x7
	.long	0xb2
	.long	0x53
	.uleb128 0x8
	.long	0xb2
	.byte	0x1
	.byte	0x0
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x7
	.uleb128 0x7
	.long	0xc9
	.long	0x41
	.uleb128 0x8
	.long	0xb2
	.byte	0x3
	.byte	0x0
	.uleb128 0x4
	.long	.LASF10
	.byte	0x4
	.byte	0x1f
	.long	0x7e
	.uleb128 0x9
	.long	0x18f
	.byte	0x2c
	.byte	0x4
	.byte	0x31
	.uleb128 0xa
	.string	"gs"
	.byte	0x4
	.byte	0x22
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.string	"fs"
	.byte	0x4
	.byte	0x23
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.string	"es"
	.byte	0x4
	.byte	0x24
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.string	"ds"
	.byte	0x4
	.byte	0x25
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.string	"edi"
	.byte	0x4
	.byte	0x27
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.string	"esi"
	.byte	0x4
	.byte	0x28
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.string	"ebp"
	.byte	0x4
	.byte	0x29
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.long	.LASF11
	.byte	0x4
	.byte	0x2a
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.string	"ebx"
	.byte	0x4
	.byte	0x2b
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.string	"edx"
	.byte	0x4
	.byte	0x2c
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.string	"ecx"
	.byte	0x4
	.byte	0x2d
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.string	"eax"
	.byte	0x4
	.byte	0x2e
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xb
	.long	.LASF12
	.byte	0x4
	.byte	0x30
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x4
	.long	.LASF13
	.byte	0x4
	.byte	0x31
	.long	0xd4
	.uleb128 0xc
	.long	0x1fb
	.long	.LASF21
	.byte	0x18
	.byte	0x4
	.byte	0x46
	.uleb128 0xb
	.long	.LASF14
	.byte	0x4
	.byte	0x47
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	.LASF15
	.byte	0x4
	.byte	0x48
	.long	0x1fb
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.long	.LASF16
	.byte	0x4
	.byte	0x49
	.long	0x22f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	.LASF17
	.byte	0x4
	.byte	0x4a
	.long	0x235
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.long	.LASF18
	.byte	0x4
	.byte	0x4b
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.long	.LASF19
	.byte	0x4
	.byte	0x4c
	.long	0x24d
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x201
	.uleb128 0x2
	.long	.LASF20
	.byte	0x1
	.byte	0x6
	.uleb128 0xe
	.long	0x21e
	.byte	0x1
	.uleb128 0xf
	.long	0x41
	.uleb128 0xf
	.long	0x21e
	.uleb128 0xf
	.long	0x229
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x224
	.uleb128 0x10
	.long	0x18f
	.uleb128 0xd
	.byte	0x4
	.long	0x18f
	.uleb128 0xd
	.byte	0x4
	.long	0x208
	.uleb128 0x11
	.byte	0x4
	.uleb128 0xe
	.long	0x24d
	.byte	0x1
	.uleb128 0xf
	.long	0x65
	.uleb128 0xf
	.long	0x21e
	.uleb128 0xf
	.long	0x229
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x237
	.uleb128 0x12
	.string	"uch"
	.byte	0x2
	.byte	0x1b
	.long	0x41
	.uleb128 0x12
	.string	"ush"
	.byte	0x2
	.byte	0x1c
	.long	0x53
	.uleb128 0x12
	.string	"ulg"
	.byte	0x2
	.byte	0x1d
	.long	0x65
	.uleb128 0x5
	.long	0x2c0
	.byte	0x4
	.byte	0x1
	.byte	0x7f
	.uleb128 0x6
	.string	"n"
	.byte	0x1
	.byte	0x7d
	.long	0x25e
	.uleb128 0xc
	.long	0x2b6
	.long	.LASF22
	.byte	0x8
	.byte	0x1
	.byte	0x79
	.uleb128 0xa
	.string	"e"
	.byte	0x1
	.byte	0x7a
	.long	0x253
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.string	"b"
	.byte	0x1
	.byte	0x7b
	.long	0x253
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.string	"v"
	.byte	0x1
	.byte	0x7f
	.long	0x274
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x6
	.string	"t"
	.byte	0x1
	.byte	0x7e
	.long	0x2c0
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x285
	.uleb128 0xc
	.long	0x327
	.long	.LASF23
	.byte	0xa
	.byte	0x2
	.byte	0xb6
	.uleb128 0xb
	.long	.LASF24
	.byte	0x2
	.byte	0xb7
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	.LASF25
	.byte	0x2
	.byte	0xb8
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xb
	.long	.LASF26
	.byte	0x2
	.byte	0xb9
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xb
	.long	.LASF27
	.byte	0x2
	.byte	0xba
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.long	.LASF28
	.byte	0x2
	.byte	0xbb
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	.LASF29
	.byte	0x2
	.byte	0xbc
	.long	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xc
	.long	0x350
	.long	.LASF30
	.byte	0x8
	.byte	0x2
	.byte	0xc1
	.uleb128 0xa
	.string	"crc"
	.byte	0x2
	.byte	0xc2
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	.LASF31
	.byte	0x2
	.byte	0xc3
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xc
	.long	0x3f7
	.long	.LASF32
	.byte	0x1e
	.byte	0x2
	.byte	0xc9
	.uleb128 0xb
	.long	.LASF24
	.byte	0x2
	.byte	0xca
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	.LASF33
	.byte	0x2
	.byte	0xcb
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.long	.LASF26
	.byte	0x2
	.byte	0xcc
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xb
	.long	.LASF25
	.byte	0x2
	.byte	0xcd
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	.LASF34
	.byte	0x2
	.byte	0xce
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xb
	.long	.LASF35
	.byte	0x2
	.byte	0xcf
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.string	"crc"
	.byte	0x2
	.byte	0xd0
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xb
	.long	.LASF36
	.byte	0x2
	.byte	0xd1
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xb
	.long	.LASF31
	.byte	0x2
	.byte	0xd2
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xb
	.long	.LASF37
	.byte	0x2
	.byte	0xd3
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xb
	.long	.LASF38
	.byte	0x2
	.byte	0xd4
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x13
	.long	0x435
	.long	.LASF39
	.byte	0x1
	.value	0x1e8
	.byte	0x1
	.long	0x33
	.long	.LFB12
	.long	.LFE12
	.byte	0x1
	.byte	0x54
	.uleb128 0x14
	.string	"t"
	.byte	0x1
	.value	0x1e4
	.long	0x2c0
	.byte	0x1
	.byte	0x50
	.uleb128 0x15
	.string	"p"
	.byte	0x1
	.value	0x1e9
	.long	0x2c0
	.byte	0x1
	.byte	0x50
	.uleb128 0x16
	.string	"q"
	.byte	0x1
	.value	0x1e9
	.long	0x2c0
	.byte	0x0
	.uleb128 0x17
	.long	0x459
	.long	.LASF40
	.byte	0x2
	.byte	0x86
	.byte	0x1
	.long	.LFB24
	.long	.LFE24
	.byte	0x1
	.byte	0x54
	.uleb128 0x18
	.string	"ptr"
	.byte	0x2
	.byte	0x85
	.long	0x459
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x235
	.uleb128 0x17
	.long	0x481
	.long	.LASF41
	.byte	0x2
	.byte	0xb0
	.byte	0x1
	.long	.LFB27
	.long	.LFE27
	.byte	0x1
	.byte	0x54
	.uleb128 0x18
	.string	"x"
	.byte	0x2
	.byte	0xaf
	.long	0x1fb
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x13
	.long	0x612
	.long	.LASF42
	.byte	0x1
	.value	0x116
	.byte	0x1
	.long	0x33
	.long	.LFB11
	.long	.LFE11
	.byte	0x1
	.byte	0x54
	.uleb128 0x14
	.string	"b"
	.byte	0x1
	.value	0x10a
	.long	0x612
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x14
	.string	"n"
	.byte	0x1
	.value	0x10b
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 52
	.uleb128 0x14
	.string	"s"
	.byte	0x1
	.value	0x10c
	.long	0x70
	.byte	0x3
	.byte	0x91
	.sleb128 1456
	.uleb128 0x14
	.string	"d"
	.byte	0x1
	.value	0x10d
	.long	0x618
	.byte	0x3
	.byte	0x91
	.sleb128 1460
	.uleb128 0x14
	.string	"e"
	.byte	0x1
	.value	0x10e
	.long	0x618
	.byte	0x3
	.byte	0x91
	.sleb128 1464
	.uleb128 0x14
	.string	"t"
	.byte	0x1
	.value	0x10f
	.long	0x623
	.byte	0x3
	.byte	0x91
	.sleb128 1468
	.uleb128 0x14
	.string	"m"
	.byte	0x1
	.value	0x110
	.long	0x629
	.byte	0x1
	.byte	0x53
	.uleb128 0x15
	.string	"a"
	.byte	0x1
	.value	0x117
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x15
	.string	"c"
	.byte	0x1
	.value	0x118
	.long	0x62f
	.byte	0x3
	.byte	0x91
	.sleb128 1356
	.uleb128 0x15
	.string	"f"
	.byte	0x1
	.value	0x119
	.long	0x70
	.byte	0x1
	.byte	0x52
	.uleb128 0x15
	.string	"g"
	.byte	0x1
	.value	0x11a
	.long	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 44
	.uleb128 0x15
	.string	"h"
	.byte	0x1
	.value	0x11b
	.long	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.value	0x11c
	.long	0x70
	.byte	0x1
	.byte	0x57
	.uleb128 0x15
	.string	"j"
	.byte	0x1
	.value	0x11d
	.long	0x70
	.byte	0x1
	.byte	0x56
	.uleb128 0x15
	.string	"k"
	.byte	0x1
	.value	0x11e
	.long	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x15
	.string	"l"
	.byte	0x1
	.value	0x11f
	.long	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x15
	.string	"p"
	.byte	0x1
	.value	0x120
	.long	0x612
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.string	"q"
	.byte	0x1
	.value	0x121
	.long	0x2c0
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.string	"r"
	.byte	0x1
	.value	0x122
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x15
	.string	"u"
	.byte	0x1
	.value	0x123
	.long	0x63f
	.byte	0x3
	.byte	0x91
	.sleb128 1292
	.uleb128 0x15
	.string	"v"
	.byte	0x1
	.value	0x124
	.long	0x64f
	.byte	0x3
	.byte	0x91
	.sleb128 140
	.uleb128 0x15
	.string	"w"
	.byte	0x1
	.value	0x125
	.long	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x15
	.string	"x"
	.byte	0x1
	.value	0x126
	.long	0x62f
	.byte	0x2
	.byte	0x91
	.sleb128 60
	.uleb128 0x15
	.string	"xp"
	.byte	0x1
	.value	0x127
	.long	0x612
	.byte	0x1
	.byte	0x51
	.uleb128 0x15
	.string	"y"
	.byte	0x1
	.value	0x128
	.long	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x15
	.string	"z"
	.byte	0x1
	.value	0x129
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x19
	.long	0x660
	.long	.LBB2
	.long	.LBE2
	.uleb128 0x1a
	.long	0x671
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1b
	.long	.Ldebug_ranges0+0x0
	.uleb128 0x1c
	.long	0x67c
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x70
	.uleb128 0xd
	.byte	0x4
	.long	0x61e
	.uleb128 0x10
	.long	0x25e
	.uleb128 0xd
	.byte	0x4
	.long	0x2c0
	.uleb128 0xd
	.byte	0x4
	.long	0x33
	.uleb128 0x7
	.long	0x63f
	.long	0x70
	.uleb128 0x8
	.long	0xb2
	.byte	0x10
	.byte	0x0
	.uleb128 0x7
	.long	0x64f
	.long	0x2c0
	.uleb128 0x8
	.long	0xb2
	.byte	0xf
	.byte	0x0
	.uleb128 0x7
	.long	0x660
	.long	0x70
	.uleb128 0x1d
	.long	0xb2
	.value	0x11f
	.byte	0x0
	.uleb128 0x1e
	.long	0x686
	.long	.LASF43
	.byte	0x2
	.byte	0x6a
	.byte	0x1
	.long	0x235
	.byte	0x1
	.uleb128 0x1f
	.long	.LASF44
	.byte	0x2
	.byte	0x69
	.long	0x33
	.uleb128 0x20
	.string	"p"
	.byte	0x2
	.byte	0x6b
	.long	0x235
	.byte	0x0
	.uleb128 0x17
	.long	0x6d6
	.long	.LASF45
	.byte	0x2
	.byte	0x9b
	.byte	0x1
	.long	.LFB26
	.long	.LFE26
	.byte	0x1
	.byte	0x54
	.uleb128 0x21
	.string	"c"
	.byte	0x2
	.byte	0x9c
	.long	0x269
	.byte	0x1
	.byte	0x53
	.uleb128 0x21
	.string	"n"
	.byte	0x2
	.byte	0x9d
	.long	0x70
	.byte	0x1
	.byte	0x51
	.uleb128 0x21
	.string	"in"
	.byte	0x2
	.byte	0x9e
	.long	0x6d6
	.byte	0x1
	.byte	0x56
	.uleb128 0x21
	.string	"out"
	.byte	0x2
	.byte	0x9e
	.long	0x6d6
	.byte	0x1
	.byte	0x52
	.uleb128 0x20
	.string	"ch"
	.byte	0x2
	.byte	0x9e
	.long	0x253
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x253
	.uleb128 0x22
	.long	.LASF54
	.byte	0x2
	.byte	0x8f
	.byte	0x1
	.long	0x33
	.long	.LFB25
	.long	.LFE25
	.byte	0x1
	.byte	0x54
	.uleb128 0x13
	.long	0x886
	.long	.LASF46
	.byte	0x1
	.value	0x1fd
	.byte	0x1
	.long	0x33
	.long	.LFB13
	.long	.LFE13
	.byte	0x1
	.byte	0x54
	.uleb128 0x14
	.string	"tl"
	.byte	0x1
	.value	0x1f9
	.long	0x2c0
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x14
	.string	"td"
	.byte	0x1
	.value	0x1f9
	.long	0x2c0
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x14
	.string	"bl"
	.byte	0x1
	.value	0x1fa
	.long	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 44
	.uleb128 0x14
	.string	"bd"
	.byte	0x1
	.value	0x1fa
	.long	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x15
	.string	"e"
	.byte	0x1
	.value	0x1fe
	.long	0x70
	.byte	0x1
	.byte	0x53
	.uleb128 0x15
	.string	"n"
	.byte	0x1
	.value	0x1ff
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x15
	.string	"d"
	.byte	0x1
	.value	0x1ff
	.long	0x70
	.byte	0x1
	.byte	0x57
	.uleb128 0x15
	.string	"w"
	.byte	0x1
	.value	0x200
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.string	"t"
	.byte	0x1
	.value	0x201
	.long	0x2c0
	.byte	0x1
	.byte	0x57
	.uleb128 0x15
	.string	"ml"
	.byte	0x1
	.value	0x202
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.string	"md"
	.byte	0x1
	.value	0x202
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.string	"b"
	.byte	0x1
	.value	0x203
	.long	0x269
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.string	"k"
	.byte	0x1
	.value	0x204
	.long	0x70
	.byte	0x1
	.byte	0x56
	.uleb128 0x23
	.long	0x7da
	.long	0x886
	.long	.LBB5
	.long	.LBE5
	.uleb128 0x24
	.long	.LBB7
	.long	.LBE7
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0x7fd
	.long	0x886
	.long	.LBB8
	.long	.LBE8
	.uleb128 0x24
	.long	.LBB10
	.long	.LBE10
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0x820
	.long	0x886
	.long	.LBB11
	.long	.LBE11
	.uleb128 0x24
	.long	.LBB13
	.long	.LBE13
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0x843
	.long	0x886
	.long	.LBB14
	.long	.LBE14
	.uleb128 0x24
	.long	.LBB16
	.long	.LBE16
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0x866
	.long	0x886
	.long	.LBB17
	.long	.LBE17
	.uleb128 0x24
	.long	.LBB19
	.long	.LBE19
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.long	0x886
	.long	.LBB20
	.long	.LBE20
	.uleb128 0x24
	.long	.LBB22
	.long	.LBE22
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.long	0x8a3
	.long	.LASF47
	.byte	0x2
	.byte	0x4d
	.byte	0x1
	.long	0x253
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x20
	.string	"b"
	.byte	0x2
	.byte	0x4f
	.long	0x253
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.long	0xd04
	.byte	0x1
	.long	.LASF56
	.byte	0x1
	.value	0x423
	.long	0x33
	.long	.LFB20
	.long	.LFE20
	.byte	0x1
	.byte	0x54
	.uleb128 0x16
	.string	"res"
	.byte	0x1
	.value	0x424
	.long	0x33
	.uleb128 0x19
	.long	0xd04
	.long	.LBB23
	.long	.LBE23
	.uleb128 0x25
	.long	0xd16
	.byte	0x2
	.byte	0x91
	.sleb128 60
	.uleb128 0x1c
	.long	0xd20
	.uleb128 0x25
	.long	0xd2a
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x25
	.long	0xd34
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x24
	.long	.LBB24
	.long	.LBE24
	.uleb128 0x25
	.long	0xd16
	.byte	0x2
	.byte	0x91
	.sleb128 60
	.uleb128 0x1c
	.long	0xd20
	.uleb128 0x25
	.long	0xd2a
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x25
	.long	0xd34
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x23
	.long	0x94c
	.long	0xd41
	.long	.LBB25
	.long	.LBE25
	.uleb128 0x28
	.long	0xd53
	.uleb128 0x1b
	.long	.Ldebug_ranges0+0x18
	.uleb128 0x25
	.long	0xd5d
	.byte	0x1
	.byte	0x50
	.uleb128 0x25
	.long	0xd67
	.byte	0x1
	.byte	0x56
	.uleb128 0x25
	.long	0xd71
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0x963
	.long	0xd7c
	.long	.LBB27
	.long	.LBE27
	.uleb128 0x28
	.long	0xd89
	.byte	0x0
	.uleb128 0x23
	.long	0x984
	.long	0x886
	.long	.LBB35
	.long	.LBE35
	.uleb128 0x24
	.long	.LBB37
	.long	.LBE37
	.uleb128 0x1c
	.long	0x898
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0x9a7
	.long	0x886
	.long	.LBB38
	.long	.LBE38
	.uleb128 0x24
	.long	.LBB40
	.long	.LBE40
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0xbbf
	.long	0xd95
	.long	.LBB41
	.long	.LBE41
	.uleb128 0x25
	.long	0xda7
	.byte	0x1
	.byte	0x55
	.uleb128 0x25
	.long	0xdb1
	.byte	0x1
	.byte	0x53
	.uleb128 0x25
	.long	0xdbb
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x25
	.long	0xdc5
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x25
	.long	0xdcf
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x25
	.long	0xdd9
	.byte	0x2
	.byte	0x91
	.sleb128 52
	.uleb128 0x25
	.long	0xde4
	.byte	0x2
	.byte	0x91
	.sleb128 44
	.uleb128 0x25
	.long	0xdef
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x25
	.long	0xdfa
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x25
	.long	0xe05
	.byte	0x1
	.byte	0x55
	.uleb128 0x25
	.long	0xe10
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x25
	.long	0xe1b
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x25
	.long	0xe26
	.byte	0x3
	.byte	0x91
	.sleb128 1216
	.uleb128 0x25
	.long	0xe31
	.byte	0x1
	.byte	0x57
	.uleb128 0x25
	.long	0xe3b
	.byte	0x1
	.byte	0x56
	.uleb128 0x24
	.long	.LBB42
	.long	.LBE42
	.uleb128 0x25
	.long	0xda7
	.byte	0x1
	.byte	0x55
	.uleb128 0x25
	.long	0xdb1
	.byte	0x1
	.byte	0x53
	.uleb128 0x25
	.long	0xdbb
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x25
	.long	0xdc5
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x25
	.long	0xdcf
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x25
	.long	0xdd9
	.byte	0x2
	.byte	0x91
	.sleb128 52
	.uleb128 0x25
	.long	0xde4
	.byte	0x2
	.byte	0x91
	.sleb128 44
	.uleb128 0x25
	.long	0xdef
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x25
	.long	0xdfa
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x25
	.long	0xe05
	.byte	0x1
	.byte	0x55
	.uleb128 0x25
	.long	0xe10
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x25
	.long	0xe1b
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x25
	.long	0xe26
	.byte	0x3
	.byte	0x91
	.sleb128 1216
	.uleb128 0x25
	.long	0xe31
	.byte	0x1
	.byte	0x57
	.uleb128 0x25
	.long	0xe3b
	.byte	0x1
	.byte	0x56
	.uleb128 0x23
	.long	0xacc
	.long	0x886
	.long	.LBB43
	.long	.LBE43
	.uleb128 0x24
	.long	.LBB45
	.long	.LBE45
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0xaef
	.long	0x886
	.long	.LBB46
	.long	.LBE46
	.uleb128 0x24
	.long	.LBB48
	.long	.LBE48
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0xb12
	.long	0x886
	.long	.LBB49
	.long	.LBE49
	.uleb128 0x24
	.long	.LBB51
	.long	.LBE51
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0xb35
	.long	0x886
	.long	.LBB52
	.long	.LBE52
	.uleb128 0x24
	.long	.LBB54
	.long	.LBE54
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0xb58
	.long	0x886
	.long	.LBB55
	.long	.LBE55
	.uleb128 0x24
	.long	.LBB57
	.long	.LBE57
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0xb7b
	.long	0x886
	.long	.LBB58
	.long	.LBE58
	.uleb128 0x24
	.long	.LBB60
	.long	.LBE60
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0xb9e
	.long	0x886
	.long	.LBB61
	.long	.LBE61
	.uleb128 0x24
	.long	.LBB63
	.long	.LBE63
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.long	0x886
	.long	.LBB64
	.long	.LBE64
	.uleb128 0x24
	.long	.LBB66
	.long	.LBE66
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0xc78
	.long	0xe57
	.long	.LBB67
	.long	.LBE67
	.uleb128 0x25
	.long	0xe69
	.byte	0x1
	.byte	0x57
	.uleb128 0x25
	.long	0xe73
	.byte	0x1
	.byte	0x55
	.uleb128 0x25
	.long	0xe7d
	.byte	0x1
	.byte	0x56
	.uleb128 0x25
	.long	0xe87
	.byte	0x1
	.byte	0x53
	.uleb128 0x24
	.long	.LBB68
	.long	.LBE68
	.uleb128 0x25
	.long	0xe69
	.byte	0x1
	.byte	0x57
	.uleb128 0x25
	.long	0xe73
	.byte	0x1
	.byte	0x55
	.uleb128 0x25
	.long	0xe7d
	.byte	0x1
	.byte	0x56
	.uleb128 0x25
	.long	0xe87
	.byte	0x1
	.byte	0x53
	.uleb128 0x23
	.long	0xc34
	.long	0x886
	.long	.LBB69
	.long	.LBE69
	.uleb128 0x24
	.long	.LBB71
	.long	.LBE71
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0xc57
	.long	0x886
	.long	.LBB72
	.long	.LBE72
	.uleb128 0x24
	.long	.LBB74
	.long	.LBE74
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.long	0x886
	.long	.LBB75
	.long	.LBE75
	.uleb128 0x24
	.long	.LBB77
	.long	.LBE77
	.uleb128 0x25
	.long	0x898
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.long	0xcf4
	.long	0xe92
	.long	.LBB78
	.long	.LBE78
	.uleb128 0x25
	.long	0xea4
	.byte	0x1
	.byte	0x53
	.uleb128 0x25
	.long	0xeae
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x25
	.long	0xeb9
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x25
	.long	0xec4
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x25
	.long	0xecf
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x25
	.long	0xeda
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x24
	.long	.LBB79
	.long	.LBE79
	.uleb128 0x25
	.long	0xea4
	.byte	0x1
	.byte	0x53
	.uleb128 0x25
	.long	0xeae
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x25
	.long	0xeb9
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x25
	.long	0xec4
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x25
	.long	0xecf
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x25
	.long	0xeda
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.long	0xee5
	.long	.LBB82
	.long	.LBE82
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.long	0xd41
	.long	.LASF48
	.byte	0x1
	.value	0x3b6
	.byte	0x1
	.long	0x33
	.byte	0x1
	.uleb128 0x16
	.string	"e"
	.byte	0x1
	.value	0x3b7
	.long	0x33
	.uleb128 0x16
	.string	"r"
	.byte	0x1
	.value	0x3b8
	.long	0x33
	.uleb128 0x16
	.string	"h"
	.byte	0x1
	.value	0x3b9
	.long	0x70
	.uleb128 0x16
	.string	"ptr"
	.byte	0x1
	.value	0x3ba
	.long	0x235
	.byte	0x0
	.uleb128 0x2a
	.long	0xd7c
	.long	.LASF49
	.byte	0x1
	.value	0x388
	.byte	0x1
	.long	0x33
	.byte	0x1
	.uleb128 0x2b
	.string	"e"
	.byte	0x1
	.value	0x386
	.long	0x629
	.uleb128 0x16
	.string	"t"
	.byte	0x1
	.value	0x389
	.long	0x70
	.uleb128 0x16
	.string	"b"
	.byte	0x1
	.value	0x38a
	.long	0x269
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.value	0x38b
	.long	0x70
	.byte	0x0
	.uleb128 0x2c
	.long	0xd95
	.long	.LASF50
	.byte	0x2
	.byte	0x81
	.byte	0x1
	.byte	0x1
	.uleb128 0x2d
	.string	"ptr"
	.byte	0x2
	.byte	0x80
	.long	0x459
	.byte	0x0
	.uleb128 0x2a
	.long	0xe46
	.long	.LASF51
	.byte	0x1
	.value	0x2d5
	.byte	0x1
	.long	0x33
	.byte	0x1
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.value	0x2d6
	.long	0x33
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.value	0x2d7
	.long	0x70
	.uleb128 0x16
	.string	"l"
	.byte	0x1
	.value	0x2d8
	.long	0x70
	.uleb128 0x16
	.string	"m"
	.byte	0x1
	.value	0x2d9
	.long	0x70
	.uleb128 0x16
	.string	"n"
	.byte	0x1
	.value	0x2da
	.long	0x70
	.uleb128 0x16
	.string	"tl"
	.byte	0x1
	.value	0x2db
	.long	0x2c0
	.uleb128 0x16
	.string	"td"
	.byte	0x1
	.value	0x2dc
	.long	0x2c0
	.uleb128 0x16
	.string	"bl"
	.byte	0x1
	.value	0x2dd
	.long	0x33
	.uleb128 0x16
	.string	"bd"
	.byte	0x1
	.value	0x2de
	.long	0x33
	.uleb128 0x16
	.string	"nb"
	.byte	0x1
	.value	0x2df
	.long	0x70
	.uleb128 0x16
	.string	"nl"
	.byte	0x1
	.value	0x2e0
	.long	0x70
	.uleb128 0x16
	.string	"nd"
	.byte	0x1
	.value	0x2e1
	.long	0x70
	.uleb128 0x16
	.string	"ll"
	.byte	0x1
	.value	0x2e5
	.long	0xe46
	.uleb128 0x16
	.string	"b"
	.byte	0x1
	.value	0x2e7
	.long	0x269
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.value	0x2e8
	.long	0x70
	.byte	0x0
	.uleb128 0x7
	.long	0xe57
	.long	0x70
	.uleb128 0x1d
	.long	0xb2
	.value	0x13b
	.byte	0x0
	.uleb128 0x2a
	.long	0xe92
	.long	.LASF52
	.byte	0x1
	.value	0x267
	.byte	0x1
	.long	0x33
	.byte	0x1
	.uleb128 0x16
	.string	"n"
	.byte	0x1
	.value	0x268
	.long	0x70
	.uleb128 0x16
	.string	"w"
	.byte	0x1
	.value	0x269
	.long	0x70
	.uleb128 0x16
	.string	"b"
	.byte	0x1
	.value	0x26a
	.long	0x269
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.value	0x26b
	.long	0x70
	.byte	0x0
	.uleb128 0x2a
	.long	0xee5
	.long	.LASF53
	.byte	0x1
	.value	0x2a1
	.byte	0x1
	.long	0x33
	.byte	0x1
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.value	0x2a2
	.long	0x33
	.uleb128 0x16
	.string	"tl"
	.byte	0x1
	.value	0x2a3
	.long	0x2c0
	.uleb128 0x16
	.string	"td"
	.byte	0x1
	.value	0x2a4
	.long	0x2c0
	.uleb128 0x16
	.string	"bl"
	.byte	0x1
	.value	0x2a5
	.long	0x33
	.uleb128 0x16
	.string	"bd"
	.byte	0x1
	.value	0x2a6
	.long	0x33
	.uleb128 0x16
	.string	"l"
	.byte	0x1
	.value	0x2a7
	.long	0x64f
	.byte	0x0
	.uleb128 0x2e
	.long	.LASF55
	.byte	0x2
	.byte	0x59
	.byte	0x1
	.byte	0x3
	.uleb128 0x2f
	.long	0xfdb
	.byte	0x1
	.long	.LASF57
	.byte	0x2
	.byte	0xef
	.byte	0x1
	.long	0x33
	.long	.LFB28
	.long	.LFE28
	.byte	0x1
	.byte	0x54
	.uleb128 0x30
	.long	.LASF58
	.byte	0x2
	.byte	0xee
	.long	0x235
	.byte	0x1
	.byte	0x53
	.uleb128 0x30
	.long	.LASF44
	.byte	0x2
	.byte	0xee
	.long	0x65
	.byte	0x1
	.byte	0x56
	.uleb128 0x30
	.long	.LASF59
	.byte	0x2
	.byte	0xee
	.long	0xfdb
	.byte	0x1
	.byte	0x55
	.uleb128 0x30
	.long	.LASF60
	.byte	0x2
	.byte	0xef
	.long	0xfdb
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x30
	.long	.LASF61
	.byte	0x2
	.byte	0xef
	.long	0xfdb
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x30
	.long	.LASF62
	.byte	0x2
	.byte	0xef
	.long	0xfdb
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x20
	.string	"gzh"
	.byte	0x2
	.byte	0xf0
	.long	0xfe1
	.uleb128 0x31
	.long	.LASF63
	.byte	0x2
	.byte	0xf1
	.long	0xfe7
	.uleb128 0x32
	.long	.LASF64
	.byte	0x2
	.byte	0xf2
	.long	0x65
	.byte	0x1
	.byte	0x52
	.uleb128 0x24
	.long	.LBB84
	.long	.LBE84
	.uleb128 0x21
	.string	"gzt"
	.byte	0x2
	.byte	0xf5
	.long	0xfed
	.byte	0x1
	.byte	0x57
	.uleb128 0x33
	.long	0xfad
	.long	.LBB85
	.long	.LBE85
	.uleb128 0x16
	.string	"len"
	.byte	0x2
	.value	0x10a
	.long	0x70
	.byte	0x0
	.uleb128 0x33
	.long	0xfc5
	.long	.LBB86
	.long	.LBE86
	.uleb128 0x16
	.string	"p"
	.byte	0x2
	.value	0x10f
	.long	0xff3
	.byte	0x0
	.uleb128 0x24
	.long	.LBB87
	.long	.LBE87
	.uleb128 0x16
	.string	"p"
	.byte	0x2
	.value	0x118
	.long	0xff3
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x65
	.uleb128 0xd
	.byte	0x4
	.long	0x2c6
	.uleb128 0xd
	.byte	0x4
	.long	0x350
	.uleb128 0xd
	.byte	0x4
	.long	0x327
	.uleb128 0xd
	.byte	0x4
	.long	0x41
	.uleb128 0x34
	.long	0x10ae
	.byte	0x1
	.long	.LASF65
	.byte	0x2
	.value	0x163
	.byte	0x1
	.long	0x235
	.long	.LFB29
	.long	.LFE29
	.byte	0x1
	.byte	0x54
	.uleb128 0x35
	.long	.LASF58
	.byte	0x2
	.value	0x161
	.long	0x235
	.byte	0x1
	.byte	0x50
	.uleb128 0x35
	.long	.LASF36
	.byte	0x2
	.value	0x161
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x35
	.long	.LASF31
	.byte	0x2
	.value	0x161
	.long	0x65
	.byte	0x1
	.byte	0x55
	.uleb128 0x35
	.long	.LASF61
	.byte	0x2
	.value	0x162
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x35
	.long	.LASF66
	.byte	0x2
	.value	0x162
	.long	0x235
	.byte	0x1
	.byte	0x57
	.uleb128 0x19
	.long	0x10ae
	.long	.LBB88
	.long	.LBE88
	.uleb128 0x25
	.long	0x10bc
	.byte	0x1
	.byte	0x51
	.uleb128 0x25
	.long	0x10c6
	.byte	0x1
	.byte	0x56
	.uleb128 0x25
	.long	0x10d0
	.byte	0x1
	.byte	0x53
	.uleb128 0x25
	.long	0x10da
	.byte	0x1
	.byte	0x52
	.uleb128 0x24
	.long	.LBB89
	.long	.LBE89
	.uleb128 0x25
	.long	0x10bc
	.byte	0x1
	.byte	0x51
	.uleb128 0x25
	.long	0x10c6
	.byte	0x1
	.byte	0x56
	.uleb128 0x25
	.long	0x10d0
	.byte	0x1
	.byte	0x53
	.uleb128 0x25
	.long	0x10da
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0x10ef
	.long	.LASF67
	.byte	0x1
	.value	0x3f4
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.string	"c"
	.byte	0x1
	.value	0x3f7
	.long	0x10ef
	.uleb128 0x16
	.string	"e"
	.byte	0x1
	.value	0x3f8
	.long	0x10ef
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.value	0x3f9
	.long	0x33
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.value	0x3fa
	.long	0x33
	.uleb128 0x16
	.string	"p"
	.byte	0x1
	.value	0x3fd
	.long	0x110b
	.byte	0x0
	.uleb128 0x2
	.long	.LASF68
	.byte	0x4
	.byte	0x7
	.uleb128 0x7
	.long	0x1106
	.long	0x1106
	.uleb128 0x8
	.long	0xb2
	.byte	0xd
	.byte	0x0
	.uleb128 0x10
	.long	0x33
	.uleb128 0x10
	.long	0x10f6
	.uleb128 0x37
	.long	.LASF69
	.byte	0x4
	.byte	0x4d
	.long	0x19a
	.byte	0x1
	.byte	0x1
	.uleb128 0x37
	.long	.LASF70
	.byte	0x5
	.byte	0x1f
	.long	0x235
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.long	.LASF71
	.byte	0x2
	.byte	0x22
	.long	0x6d6
	.byte	0x5
	.byte	0x3
	.long	inbuf
	.uleb128 0x7
	.long	0x114c
	.long	0x253
	.uleb128 0x1d
	.long	0xb2
	.value	0x7fff
	.byte	0x0
	.uleb128 0x32
	.long	.LASF72
	.byte	0x2
	.byte	0x23
	.long	0x113b
	.byte	0x5
	.byte	0x3
	.long	window
	.uleb128 0x32
	.long	.LASF73
	.byte	0x2
	.byte	0x25
	.long	0x70
	.byte	0x5
	.byte	0x3
	.long	insize
	.uleb128 0x32
	.long	.LASF74
	.byte	0x2
	.byte	0x26
	.long	0x70
	.byte	0x5
	.byte	0x3
	.long	inbytes
	.uleb128 0x32
	.long	.LASF75
	.byte	0x2
	.byte	0x27
	.long	0x70
	.byte	0x5
	.byte	0x3
	.long	outcnt
	.uleb128 0x7
	.long	0x11a0
	.long	0x269
	.uleb128 0x8
	.long	0xb2
	.byte	0xff
	.byte	0x0
	.uleb128 0x38
	.long	.LASF76
	.byte	0x1
	.value	0x3e9
	.long	0x1190
	.byte	0x5
	.byte	0x3
	.long	crc_32_tab
	.uleb128 0x32
	.long	.LASF77
	.byte	0x2
	.byte	0x5e
	.long	0x269
	.byte	0x5
	.byte	0x3
	.long	bytes_out
	.uleb128 0x32
	.long	.LASF78
	.byte	0x2
	.byte	0x5f
	.long	0x6d6
	.byte	0x5
	.byte	0x3
	.long	output_data
	.uleb128 0x32
	.long	.LASF79
	.byte	0x2
	.byte	0x60
	.long	0x269
	.byte	0x5
	.byte	0x3
	.long	output_size
	.uleb128 0x32
	.long	.LASF80
	.byte	0x2
	.byte	0x65
	.long	0x269
	.byte	0x5
	.byte	0x3
	.long	free_mem_ptr
	.uleb128 0x32
	.long	.LASF81
	.byte	0x2
	.byte	0x65
	.long	0x269
	.byte	0x5
	.byte	0x3
	.long	free_mem_end_ptr
	.uleb128 0x7
	.long	0x1217
	.long	0x1217
	.uleb128 0x8
	.long	0xb2
	.byte	0x12
	.byte	0x0
	.uleb128 0x10
	.long	0x70
	.uleb128 0x32
	.long	.LASF82
	.byte	0x1
	.byte	0x9c
	.long	0x122d
	.byte	0x5
	.byte	0x3
	.long	border
	.uleb128 0x10
	.long	0x1207
	.uleb128 0x7
	.long	0x1242
	.long	0x61e
	.uleb128 0x8
	.long	0xb2
	.byte	0x1e
	.byte	0x0
	.uleb128 0x32
	.long	.LASF83
	.byte	0x1
	.byte	0x9e
	.long	0x1253
	.byte	0x5
	.byte	0x3
	.long	cplens
	.uleb128 0x10
	.long	0x1232
	.uleb128 0x7
	.long	0x1268
	.long	0x61e
	.uleb128 0x8
	.long	0xb2
	.byte	0x1e
	.byte	0x0
	.uleb128 0x32
	.long	.LASF84
	.byte	0x1
	.byte	0xa2
	.long	0x1279
	.byte	0x5
	.byte	0x3
	.long	cplext
	.uleb128 0x10
	.long	0x1258
	.uleb128 0x7
	.long	0x128e
	.long	0x61e
	.uleb128 0x8
	.long	0xb2
	.byte	0x1d
	.byte	0x0
	.uleb128 0x32
	.long	.LASF85
	.byte	0x1
	.byte	0xa5
	.long	0x129f
	.byte	0x5
	.byte	0x3
	.long	cpdist
	.uleb128 0x10
	.long	0x127e
	.uleb128 0x7
	.long	0x12b4
	.long	0x61e
	.uleb128 0x8
	.long	0xb2
	.byte	0x1d
	.byte	0x0
	.uleb128 0x32
	.long	.LASF86
	.byte	0x1
	.byte	0xa9
	.long	0x12c5
	.byte	0x5
	.byte	0x3
	.long	cpdext
	.uleb128 0x10
	.long	0x12a4
	.uleb128 0x21
	.string	"bb"
	.byte	0x1
	.byte	0xce
	.long	0x269
	.byte	0x5
	.byte	0x3
	.long	bb
	.uleb128 0x21
	.string	"bk"
	.byte	0x1
	.byte	0xcf
	.long	0x70
	.byte	0x5
	.byte	0x3
	.long	bk
	.uleb128 0x7
	.long	0x12fa
	.long	0x61e
	.uleb128 0x8
	.long	0xb2
	.byte	0x10
	.byte	0x0
	.uleb128 0x32
	.long	.LASF87
	.byte	0x1
	.byte	0xd1
	.long	0x130b
	.byte	0x5
	.byte	0x3
	.long	mask_bits
	.uleb128 0x10
	.long	0x12ea
	.uleb128 0x39
	.long	.LASF88
	.byte	0x1
	.byte	0xfd
	.long	0x1106
	.byte	0x9
	.uleb128 0x39
	.long	.LASF89
	.byte	0x1
	.byte	0xfe
	.long	0x1106
	.byte	0x6
	.uleb128 0x38
	.long	.LASF90
	.byte	0x1
	.value	0x106
	.long	0x70
	.byte	0x5
	.byte	0x3
	.long	hufts
	.uleb128 0x15
	.string	"crc"
	.byte	0x1
	.value	0x3ea
	.long	0x269
	.byte	0x5
	.byte	0x3
	.long	crc
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x16
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
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x5
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x0
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
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0xb
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
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
	.uleb128 0x28
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.uleb128 0x1d
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x0
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
	.uleb128 0x2f
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x33
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
	.uleb128 0x34
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
	.uleb128 0x35
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
	.uleb128 0x36
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
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
	.uleb128 0x38
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
	.uleb128 0x39
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x31
	.value	0x2
	.long	.Ldebug_info0
	.long	0x134d
	.long	0x8a3
	.string	"gunzip"
	.long	0xeee
	.string	"check_zip"
	.long	0xff9
	.string	"unzip"
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
	.long	.LBB3-.Ltext0
	.long	.LBE3-.Ltext0
	.long	.LBB4-.Ltext0
	.long	.LBE4-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB26-.Ltext0
	.long	.LBE26-.Ltext0
	.long	.LBB81-.Ltext0
	.long	.LBE81-.Ltext0
	.long	.LBB34-.Ltext0
	.long	.LBE34-.Ltext0
	.long	.LBB30-.Ltext0
	.long	.LBE30-.Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF39:
	.string	"huft_free"
.LASF33:
	.string	"version"
.LASF25:
	.string	"method"
.LASF46:
	.string	"inflate_codes"
.LASF74:
	.string	"inbytes"
.LASF69:
	.string	"__com32"
.LASF1:
	.string	"short int"
.LASF12:
	.string	"eflags"
.LASF19:
	.string	"cs_farcall"
.LASF61:
	.string	"orig_crc"
.LASF24:
	.string	"magic"
.LASF86:
	.string	"cpdext"
.LASF81:
	.string	"free_mem_end_ptr"
.LASF65:
	.string	"unzip"
.LASF47:
	.string	"get_byte"
.LASF54:
	.string	"fill_inbuf"
.LASF90:
	.string	"hufts"
.LASF18:
	.string	"cs_bounce_size"
.LASF21:
	.string	"com32_sys_args"
.LASF63:
	.string	"pkzh"
.LASF84:
	.string	"cplext"
.LASF4:
	.string	"uint8_t"
.LASF40:
	.string	"gzip_release"
.LASF60:
	.string	"dbytes_p"
.LASF93:
	.string	"/home/lfs-kable/bootcd/extra/syslinux-3.09/memdisk"
.LASF35:
	.string	"modified_date"
.LASF37:
	.string	"filename_len"
.LASF83:
	.string	"cplens"
.LASF45:
	.string	"flush_window"
.LASF42:
	.string	"huft_build"
.LASF79:
	.string	"output_size"
.LASF89:
	.string	"dbits"
.LASF2:
	.string	"long long int"
.LASF31:
	.string	"dbytes"
.LASF80:
	.string	"free_mem_ptr"
.LASF56:
	.string	"gunzip"
.LASF58:
	.string	"indata"
.LASF51:
	.string	"inflate_dynamic"
.LASF50:
	.string	"gzip_mark"
.LASF28:
	.string	"extra_flags"
.LASF48:
	.string	"inflate"
.LASF13:
	.string	"com32sys_t"
.LASF3:
	.string	"unsigned char"
.LASF57:
	.string	"check_zip"
.LASF27:
	.string	"timestamp"
.LASF70:
	.string	"sys_bounce"
.LASF30:
	.string	"gzip_trailer"
.LASF75:
	.string	"outcnt"
.LASF0:
	.string	"signed char"
.LASF26:
	.string	"flags"
.LASF9:
	.string	"long long unsigned int"
.LASF7:
	.string	"uint32_t"
.LASF10:
	.string	"reg32_t"
.LASF8:
	.string	"unsigned int"
.LASF91:
	.string	"GNU C 3.4.1"
.LASF14:
	.string	"cs_sysargs"
.LASF59:
	.string	"zbytes_p"
.LASF88:
	.string	"lbits"
.LASF6:
	.string	"short unsigned int"
.LASF64:
	.string	"offset"
.LASF20:
	.string	"char"
.LASF5:
	.string	"uint16_t"
.LASF66:
	.string	"target"
.LASF87:
	.string	"mask_bits"
.LASF52:
	.string	"inflate_stored"
.LASF38:
	.string	"extra_len"
.LASF23:
	.string	"gzip_header"
.LASF36:
	.string	"zbytes"
.LASF11:
	.string	"_unused"
.LASF55:
	.string	"unget_byte"
.LASF34:
	.string	"modified_time"
.LASF92:
	.string	"unzip.c"
.LASF29:
	.string	"os_type"
.LASF68:
	.string	"long unsigned int"
.LASF77:
	.string	"bytes_out"
.LASF32:
	.string	"pkzip_header"
.LASF71:
	.string	"inbuf"
.LASF44:
	.string	"size"
.LASF78:
	.string	"output_data"
.LASF76:
	.string	"crc_32_tab"
.LASF73:
	.string	"insize"
.LASF43:
	.string	"malloc"
.LASF62:
	.string	"offset_p"
.LASF16:
	.string	"cs_intcall"
.LASF72:
	.string	"window"
.LASF85:
	.string	"cpdist"
.LASF22:
	.string	"huft"
.LASF53:
	.string	"inflate_fixed"
.LASF41:
	.string	"error"
.LASF15:
	.string	"cs_cmdline"
.LASF17:
	.string	"cs_bounce"
.LASF67:
	.string	"makecrc"
.LASF82:
	.string	"border"
.LASF49:
	.string	"inflate_block"
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.4.1"
