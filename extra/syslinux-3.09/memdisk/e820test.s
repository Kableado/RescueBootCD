	.file	"e820test.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.ident	"$Id: e820test.c,v 1.8 2004/12/14 22:46:25 hpa Exp $"
	.ident	"$Id: e820.h,v 1.4 2004/12/14 22:46:25 hpa Exp $"
	.p2align 2,,3
.globl die
	.type	die, @function
die:
.LFB18:
	.file 1 "e820test.c"
	.loc 1 32 0
	.loc 1 33 0
	call	abort
.LFE18:
	.size	die, .-die
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%016llx %016llx %d\n"
	.text
	.p2align 2,,3
.globl printranges
	.type	printranges, @function
printranges:
.LFB19:
	.loc 1 36 0
	pushl	%edi
.LCFI0:
	.loc 1 39 0
	xorl	%edi, %edi
	.loc 1 36 0
	pushl	%esi
.LCFI1:
	.loc 1 39 0
	cmpl	nranges, %edi
	.loc 1 36 0
	pushl	%ebx
.LCFI2:
	.loc 1 39 0
	jge	.L8
	xorl	%esi, %esi
.L6:
	.loc 1 40 0
	movl	ranges(%esi), %ecx
	movl	ranges+12(%esi), %eax
	subl	%ecx, %eax
	movl	ranges+4(%esi), %ebx
	movl	ranges+16(%esi), %edx
	pushl	ranges+8(%esi)
.LCFI3:
	sbbl	%ebx, %edx
	pushl	%edx
.LCFI4:
	pushl	%eax
.LCFI5:
	pushl	%ebx
.LCFI6:
	pushl	%ecx
.LCFI7:
	pushl	$.LC0
.LCFI8:
	.loc 1 39 0
	incl	%edi
	.loc 1 40 0
	call	printf
	addl	$12, %esi
	.loc 1 39 0
	addl	$24, %esp
.LCFI9:
	cmpl	nranges, %edi
	jl	.L6
.L8:
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
.LFE19:
	.size	printranges, .-printranges
	.section	.rodata.str1.1
.LC1:
	.string	" %llx %llx %d"
.LC2:
	.string	"%016llx %016llx %d <-\n"
.LC3:
	.string	"DOS  mem = %#10x (%u K)\n"
.LC4:
	.string	"Low  mem = %#10x (%u K)\n"
.LC5:
	.string	"High mem = %#10x (%u K)\n"
	.text
	.p2align 2,,3
.globl main
	.type	main, @function
main:
.LFB20:
	.loc 1 48 0
	pushl	%ebx
.LCFI10:
	subl	$4116, %esp
.LCFI11:
	.loc 1 53 0
	call	e820map_init
	.loc 1 54 0
	call	printranges
	.loc 1 56 0
	jmp	.L19
.L15:
	.loc 1 57 0
	pushl	$58
.LCFI12:
	pushl	%ebx
.LCFI13:
	call	strchr
	.loc 1 58 0
	testl	%eax, %eax
	.loc 1 57 0
	popl	%edx
.LCFI14:
	popl	%ecx
.LCFI15:
	.loc 1 58 0
	movl	%ebx, %edx
	je	.L13
	leal	1(%eax), %edx
.L13:
	.loc 1 59 0
	leal	16(%esp), %eax
	pushl	%eax
.LCFI16:
	leal	12(%esp), %eax
	pushl	%eax
.LCFI17:
	leal	8(%esp), %eax
	pushl	%eax
.LCFI18:
	pushl	$.LC1
.LCFI19:
	pushl	%edx
.LCFI20:
	call	sscanf
	addl	$20, %esp
.LCFI21:
	cmpl	$3, %eax
	jne	.L19
	.loc 1 60 0
	pushl	$2
.LCFI22:
	pushl	$10
.LCFI23:
	call	fputc
	.loc 1 61 0
	pushl	24(%esp)
.LCFI24:
	pushl	24(%esp)
.LCFI25:
	pushl	24(%esp)
.LCFI26:
	pushl	24(%esp)
.LCFI27:
	pushl	24(%esp)
.LCFI28:
	pushl	$.LC2
.LCFI29:
.LCFI30:
	call	printf
	.loc 1 62 0
	addl	$32, %esp
.LCFI31:
	pushl	$2
.LCFI32:
	pushl	$10
.LCFI33:
	call	fputc
	.loc 1 63 0
	pushl	24(%esp)
.LCFI34:
	pushl	24(%esp)
.LCFI35:
	pushl	24(%esp)
.LCFI36:
	pushl	24(%esp)
.LCFI37:
	pushl	24(%esp)
.LCFI38:
.LCFI39:
	call	insertrange
	.loc 1 64 0
.LCFI40:
	call	printranges
	addl	$28, %esp
.LCFI41:
.L19:
	pushl	$1
.LCFI42:
	pushl	$4096
.LCFI43:
	leal	28(%esp), %ebx
	pushl	%ebx
.LCFI44:
	call	fgets
	addl	$12, %esp
.LCFI45:
	testl	%eax, %eax
	jne	.L15
	.loc 1 68 0
	call	parse_mem
	.loc 1 70 0
	pushl	$2
.LCFI46:
	pushl	$10
.LCFI47:
	call	fputc
	.loc 1 71 0
	movl	dos_mem, %edx
	movl	%edx, %eax
	shrl	$10, %eax
	pushl	%eax
.LCFI48:
	pushl	%edx
.LCFI49:
	pushl	$.LC3
.LCFI50:
.LCFI51:
	call	printf
	.loc 1 72 0
	movl	low_mem, %edx
	movl	%edx, %eax
	shrl	$10, %eax
	pushl	%eax
.LCFI52:
	pushl	%edx
.LCFI53:
	pushl	$.LC4
.LCFI54:
.LCFI55:
	call	printf
	.loc 1 73 0
	movl	high_mem, %edx
	movl	%edx, %eax
	addl	$32, %esp
.LCFI56:
	shrl	$10, %eax
	pushl	%eax
.LCFI57:
	pushl	%edx
.LCFI58:
	pushl	$.LC5
.LCFI59:
	call	printf
	.loc 1 74 0
	pushl	$2
.LCFI60:
	pushl	$10
.LCFI61:
.LCFI62:
	call	fputc
	.loc 1 77 0
	pushl	$2
.LCFI63:
	pushl	$0
.LCFI64:
	xorl	%edx, %edx
	pushl	$2048
.LCFI65:
	movl	dos_mem, %eax
	pushl	%edx
.LCFI66:
	subl	$2048, %eax
	pushl	%eax
.LCFI67:
.LCFI68:
	call	insertrange
	.loc 1 79 0
	addl	$40, %esp
.LCFI69:
	call	printranges
	.loc 1 80 0
	call	parse_mem
	.loc 1 82 0
	pushl	$2
.LCFI70:
	pushl	$10
.LCFI71:
	call	fputc
	.loc 1 83 0
	movl	dos_mem, %edx
	movl	%edx, %eax
	shrl	$10, %eax
	pushl	%eax
.LCFI72:
	pushl	%edx
.LCFI73:
	pushl	$.LC3
.LCFI74:
.LCFI75:
	call	printf
	.loc 1 84 0
	movl	low_mem, %edx
	movl	%edx, %eax
	shrl	$10, %eax
	pushl	%eax
.LCFI76:
	pushl	%edx
.LCFI77:
	pushl	$.LC4
.LCFI78:
.LCFI79:
	call	printf
	.loc 1 85 0
	movl	high_mem, %edx
	movl	%edx, %eax
	addl	$32, %esp
.LCFI80:
	shrl	$10, %eax
	pushl	%eax
.LCFI81:
	pushl	%edx
.LCFI82:
	pushl	$.LC5
.LCFI83:
	call	printf
	.loc 1 86 0
	pushl	$2
.LCFI84:
	pushl	$10
.LCFI85:
.LCFI86:
	call	fputc
	.loc 1 89 0
	addl	$4136, %esp
	xorl	%eax, %eax
	popl	%ebx
	ret
.LCFI87:
.LFE20:
	.size	main, .-main
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
	.long	.LFB18
	.long	.LFE18-.LFB18
	.align 4
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB19
	.long	.LFE19-.LFB19
	.byte	0x4
	.long	.LCFI0-.LFB19
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
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
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x14
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x18
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x1c
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x20
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x24
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x28
	.byte	0x2e
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x10
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB20
	.long	.LFE20-.LFB20
	.byte	0x4
	.long	.LCFI10-.LFB20
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x101c
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x1020
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x1024
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x1020
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x101c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x1020
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x1024
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x1028
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x102c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x1030
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x101c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x1020
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0x1024
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x1028
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x102c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x1030
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x1034
	.byte	0x2e
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x1038
	.byte	0x2e
	.uleb128 0x1c
	.byte	0x4
	.long	.LCFI29-.LCFI28
	.byte	0xe
	.uleb128 0x103c
	.byte	0x2e
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI30-.LCFI29
	.byte	0x2e
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x101c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI32-.LCFI31
	.byte	0xe
	.uleb128 0x1020
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x1024
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x1028
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI35-.LCFI34
	.byte	0xe
	.uleb128 0x102c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x1030
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x1034
	.byte	0x2e
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0x1038
	.byte	0x2e
	.uleb128 0x1c
	.byte	0x4
	.long	.LCFI39-.LCFI38
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI40-.LCFI39
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0x101c
	.byte	0x4
	.long	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x1020
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0x1024
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI44-.LCFI43
	.byte	0xe
	.uleb128 0x1028
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0x101c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0x1020
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI47-.LCFI46
	.byte	0xe
	.uleb128 0x1024
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0x1028
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0x102c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI50-.LCFI49
	.byte	0xe
	.uleb128 0x1030
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI51-.LCFI50
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI52-.LCFI51
	.byte	0xe
	.uleb128 0x1034
	.byte	0x2e
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI53-.LCFI52
	.byte	0xe
	.uleb128 0x1038
	.byte	0x2e
	.uleb128 0x1c
	.byte	0x4
	.long	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0x103c
	.byte	0x2e
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI55-.LCFI54
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0x101c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0x1020
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI58-.LCFI57
	.byte	0xe
	.uleb128 0x1024
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI59-.LCFI58
	.byte	0xe
	.uleb128 0x1028
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI60-.LCFI59
	.byte	0xe
	.uleb128 0x102c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI61-.LCFI60
	.byte	0xe
	.uleb128 0x1030
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI62-.LCFI61
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI63-.LCFI62
	.byte	0xe
	.uleb128 0x1034
	.byte	0x2e
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI64-.LCFI63
	.byte	0xe
	.uleb128 0x1038
	.byte	0x2e
	.uleb128 0x1c
	.byte	0x4
	.long	.LCFI65-.LCFI64
	.byte	0xe
	.uleb128 0x103c
	.byte	0x2e
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI66-.LCFI65
	.byte	0xe
	.uleb128 0x1040
	.byte	0x2e
	.uleb128 0x24
	.byte	0x4
	.long	.LCFI67-.LCFI66
	.byte	0xe
	.uleb128 0x1044
	.byte	0x2e
	.uleb128 0x28
	.byte	0x4
	.long	.LCFI68-.LCFI67
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI69-.LCFI68
	.byte	0xe
	.uleb128 0x101c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI70-.LCFI69
	.byte	0xe
	.uleb128 0x1020
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI71-.LCFI70
	.byte	0xe
	.uleb128 0x1024
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI72-.LCFI71
	.byte	0xe
	.uleb128 0x1028
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI73-.LCFI72
	.byte	0xe
	.uleb128 0x102c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI74-.LCFI73
	.byte	0xe
	.uleb128 0x1030
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI75-.LCFI74
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI76-.LCFI75
	.byte	0xe
	.uleb128 0x1034
	.byte	0x2e
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI77-.LCFI76
	.byte	0xe
	.uleb128 0x1038
	.byte	0x2e
	.uleb128 0x1c
	.byte	0x4
	.long	.LCFI78-.LCFI77
	.byte	0xe
	.uleb128 0x103c
	.byte	0x2e
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI79-.LCFI78
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI80-.LCFI79
	.byte	0xe
	.uleb128 0x101c
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI81-.LCFI80
	.byte	0xe
	.uleb128 0x1020
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI82-.LCFI81
	.byte	0xe
	.uleb128 0x1024
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI83-.LCFI82
	.byte	0xe
	.uleb128 0x1028
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI84-.LCFI83
	.byte	0xe
	.uleb128 0x102c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI85-.LCFI84
	.byte	0xe
	.uleb128 0x1030
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI86-.LCFI85
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI87-.LCFI86
	.byte	0xe
	.uleb128 0x101c
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE4:
	.file 2 "../com32/include/stdint.h"
	.file 3 "e820.h"
	.text
.Letext0:
	.section	.debug_info
	.long	0x1b1
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.Ldebug_line0
	.long	.Letext0
	.long	.Ltext0
	.long	.LASF21
	.byte	0x1
	.long	.LASF22
	.long	.LASF23
	.uleb128 0x2
	.long	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x3
	.string	"int"
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.long	.LASF2
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.long	.LASF3
	.byte	0x2
	.byte	0x5
	.uleb128 0x2
	.long	.LASF4
	.byte	0x8
	.byte	0x5
	.uleb128 0x2
	.long	.LASF5
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.long	.LASF6
	.byte	0x2
	.byte	0x7
	.uleb128 0x4
	.long	.LASF7
	.byte	0x2
	.byte	0x11
	.long	0x25
	.uleb128 0x4
	.long	.LASF8
	.byte	0x2
	.byte	0x12
	.long	0x73
	.uleb128 0x2
	.long	.LASF9
	.byte	0x8
	.byte	0x7
	.uleb128 0x5
	.long	0xa3
	.long	.LASF24
	.byte	0xc
	.byte	0x3
	.byte	0x16
	.uleb128 0x6
	.long	.LASF10
	.byte	0x3
	.byte	0x17
	.long	0x68
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.long	.LASF11
	.byte	0x3
	.byte	0x18
	.long	0x5d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x7
	.byte	0x1
	.string	"die"
	.byte	0x1
	.byte	0x20
	.byte	0x1
	.long	.LFB18
	.long	.LFE18
	.byte	0x1
	.byte	0x54
	.uleb128 0x8
	.long	0xd9
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.byte	0x24
	.byte	0x1
	.long	.LFB19
	.long	.LFE19
	.byte	0x1
	.byte	0x54
	.uleb128 0x9
	.string	"i"
	.byte	0x1
	.byte	0x25
	.long	0x2c
	.byte	0x1
	.byte	0x57
	.byte	0x0
	.uleb128 0xa
	.long	0x136
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.byte	0x30
	.byte	0x1
	.long	0x2c
	.long	.LFB20
	.long	.LFE20
	.byte	0x1
	.byte	0x54
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.byte	0x31
	.long	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x9
	.string	"len"
	.byte	0x1
	.byte	0x31
	.long	0x68
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xb
	.long	.LASF11
	.byte	0x1
	.byte	0x32
	.long	0x5d
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xb
	.long	.LASF14
	.byte	0x1
	.byte	0x33
	.long	0x136
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0xc
	.string	"p"
	.byte	0x1
	.byte	0x33
	.long	0x14e
	.byte	0x0
	.uleb128 0xd
	.long	0x147
	.long	0x33
	.uleb128 0xe
	.long	0x147
	.value	0xfff
	.byte	0x0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0xf
	.byte	0x4
	.long	0x33
	.uleb128 0xd
	.long	0x15f
	.long	0x7a
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x11
	.long	.LASF15
	.byte	0x3
	.byte	0x1b
	.long	0x154
	.byte	0x1
	.byte	0x1
	.uleb128 0x11
	.long	.LASF16
	.byte	0x3
	.byte	0x1c
	.long	0x2c
	.byte	0x1
	.byte	0x1
	.uleb128 0x11
	.long	.LASF17
	.byte	0x1
	.byte	0x1d
	.long	0x5d
	.byte	0x1
	.byte	0x1
	.uleb128 0x11
	.long	.LASF18
	.byte	0x1
	.byte	0x1d
	.long	0x5d
	.byte	0x1
	.byte	0x1
	.uleb128 0x11
	.long	.LASF19
	.byte	0x1
	.byte	0x1d
	.long	0x5d
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.long	.LASF20
	.byte	0x1
	.byte	0x1a
	.long	0x1b2
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	sys_bounce
	.uleb128 0x13
	.byte	0x4
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
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x3e
	.value	0x2
	.long	.Ldebug_info0
	.long	0x1b5
	.long	0xa3
	.string	"die"
	.long	0xb6
	.string	"printranges"
	.long	0xd9
	.string	"main"
	.long	0x1a0
	.string	"sys_bounce"
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
	.section	.debug_str,"MS",@progbits,1
.LASF15:
	.string	"ranges"
.LASF17:
	.string	"dos_mem"
.LASF10:
	.string	"start"
.LASF8:
	.string	"uint64_t"
.LASF19:
	.string	"high_mem"
.LASF5:
	.string	"unsigned char"
.LASF6:
	.string	"short unsigned int"
.LASF21:
	.string	"GNU C 3.4.1"
.LASF13:
	.string	"main"
.LASF0:
	.string	"unsigned int"
.LASF9:
	.string	"long long unsigned int"
.LASF14:
	.string	"line"
.LASF20:
	.string	"sys_bounce"
.LASF4:
	.string	"long long int"
.LASF24:
	.string	"e820range"
.LASF1:
	.string	"char"
.LASF16:
	.string	"nranges"
.LASF23:
	.string	"/home/lfs-kable/bootcd/extra/syslinux-3.09/memdisk"
.LASF11:
	.string	"type"
.LASF3:
	.string	"short int"
.LASF18:
	.string	"low_mem"
.LASF7:
	.string	"uint32_t"
.LASF2:
	.string	"signed char"
.LASF22:
	.string	"e820test.c"
.LASF12:
	.string	"printranges"
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.4.1"
