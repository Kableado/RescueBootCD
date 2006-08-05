	.file	"msetup.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.ident	"$Id: msetup.c,v 1.12 2004/12/14 22:46:25 hpa Exp $"
	.ident	"$Id: memdisk.h,v 1.9 2005/03/08 18:39:32 hpa Exp $"
	.ident	"$Id: conio.h,v 1.5 2004/12/14 22:46:25 hpa Exp $"
	.ident	"$Id: e820.h,v 1.4 2004/12/14 22:46:25 hpa Exp $"
.globl high_mem
	.bss
	.align 4
	.type	high_mem, @object
	.size	high_mem, 4
high_mem:
	.zero	4
.globl low_mem
	.align 4
	.type	low_mem, @object
	.size	low_mem, 4
low_mem:
	.zero	4
.globl dos_mem
	.align 4
	.type	dos_mem, @object
	.size	dos_mem, 4
dos_mem:
	.zero	4
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"e820: %08x%08x %08x%08x %d\n"
.LC1:
	.string	" DOS: %d K\n"
.LC2:
	.string	"e801: %04x %04x\n"
.LC3:
	.string	"  88: %04x\n"
.LC4:
	.string	"MEMDISK: Unable to obtain memory map\n"
	.text
	.p2align 2,,3
.globl get_mem
	.type	get_mem, @function
get_mem:
.LFB13:
	.file 1 "msetup.c"
	.loc 1 125 0
	pushl	%edi
.LCFI0:
	pushl	%esi
.LCFI1:
	pushl	%ebx
.LCFI2:
	subl	$192, %esp
.LCFI3:
.LBB2:
.LBB3:
	.loc 1 33 0
	xorl	%esi, %esi
	.loc 1 36 0
	leal	144(%esp), %edi
	cld
	movl	$11, %ecx
	movl	%esi, %eax
	.loc 1 31 0
	movl	sys_bounce, %ebx
	.loc 1 36 0
	rep
	stosl
.L3:
.LBB4:
.LBB5:
	.file 2 "../com32/include/com32.h"
	.loc 2 109 0
	movl	%ebx, %eax
	andl	$15, %eax
.LBE5:
.LBE4:
	.loc 2 107 0
	movw	%ax, 152(%esp)
.LBB6:
.LBB7:
	.loc 2 103 0
	movl	%ebx, %eax
	shrl	$4, %eax
.LBE7:
.LBE6:
	.loc 2 102 0
	movw	%ax, 148(%esp)
	.loc 1 45 0
	leal	144(%esp), %eax
	.loc 1 39 0
	movl	$59424, 180(%esp)
	.loc 1 40 0
	movl	$20, 176(%esp)
	.loc 1 41 0
	movl	$1397571920, 172(%esp)
	.loc 1 45 0
	pushl	%eax
.LCFI4:
	pushl	%eax
.LCFI5:
	pushl	$21
.LCFI6:
	call	*syscall
	addl	$12, %esp
.LCFI7:
	.loc 1 46 0
	xorl	%eax, %eax
	testb	$1, 184(%esp)
	jne	.L9
	movl	176(%esp), %eax
.L9:
	.loc 1 48 0
	cmpl	$1397571920, 180(%esp)
	jne	.L4
	cmpl	$19, %eax
	jbe	.L4
	.loc 1 51 0
	pushl	16(%ebx)
.LCFI8:
	pushl	8(%ebx)
.LCFI9:
	pushl	12(%ebx)
.LCFI10:
	pushl	(%ebx)
.LCFI11:
	pushl	4(%ebx)
.LCFI12:
	pushl	$.LC0
.LCFI13:
	call	printf
	addl	$24, %esp
.LCFI14:
	.loc 1 56 0
	pushl	16(%ebx)
.LCFI15:
	pushl	12(%ebx)
.LCFI16:
	pushl	8(%ebx)
.LCFI17:
	pushl	4(%ebx)
.LCFI18:
	pushl	(%ebx)
.LCFI19:
	call	insertrange
	addl	$20, %esp
.LCFI20:
	.loc 1 57 0
	incl	%esi
	.loc 1 59 0
	cmpl	$0, 168(%esp)
	jne	.L3
.L4:
.LBE3:
.LBE2:
	.loc 1 26 0
	testl	%esi, %esi
	jne	.L1
.LBB8:
.LBB9:
	.loc 1 68 0
	movl	$11, %ebx
	leal	96(%esp), %edi
	cld
	movl	%esi, %eax
	movl	%ebx, %ecx
	rep
	stosl
	.loc 1 69 0
	leal	96(%esp), %eax
	pushl	%eax
.LCFI21:
	pushl	%eax
.LCFI22:
	pushl	$18
.LCFI23:
	call	*syscall
	addl	$12, %esp
.LCFI24:
	.loc 1 70 0
	pushl	$1
.LCFI25:
	movzwl	136(%esp), %eax
	xorl	%edx, %edx
	pushl	%edx
.LCFI26:
	sall	$10, %eax
	pushl	%eax
.LCFI27:
	pushl	$0
.LCFI28:
	pushl	$0
.LCFI29:
	call	insertrange
	addl	$20, %esp
.LCFI30:
	.loc 1 71 0
	movzwl	132(%esp), %eax
	pushl	%eax
.LCFI31:
	pushl	$.LC1
.LCFI32:
	call	printf
	popl	%ecx
.LCFI33:
	popl	%edi
.LCFI34:
.LBE9:
.LBE8:
.LBB10:
.LBB11:
	.loc 1 79 0
	leal	48(%esp), %edi
	cld
	movl	%esi, %eax
	movl	%ebx, %ecx
	rep
	stosl
	.loc 1 82 0
	leal	48(%esp), %eax
	.loc 1 81 0
	movw	$-6143, 84(%esp)
	.loc 1 82 0
	pushl	%eax
.LCFI35:
	pushl	%eax
.LCFI36:
	pushl	$21
.LCFI37:
	call	*syscall
	addl	$12, %esp
.LCFI38:
	.loc 1 84 0
	testb	$1, 88(%esp)
	jne	.L23
	.loc 1 85 0
	movl	84(%esp), %eax
	testw	%ax, %ax
	je	.L16
	.loc 1 86 0
	pushl	$1
.LCFI39:
	xorl	%edx, %edx
	movzwl	%ax, %eax
	pushl	%edx
.LCFI40:
	sall	$10, %eax
	pushl	%eax
.LCFI41:
	pushl	$0
.LCFI42:
	pushl	$1048576
.LCFI43:
	call	insertrange
	addl	$20, %esp
.LCFI44:
.L16:
	.loc 1 88 0
	movl	72(%esp), %eax
	testw	%ax, %ax
	je	.L17
	.loc 1 89 0
	pushl	$1
.LCFI45:
	xorl	%edx, %edx
	pushl	%edx
.LCFI46:
	sall	$16, %eax
	pushl	%eax
.LCFI47:
	pushl	$0
.LCFI48:
	pushl	$16777216
.LCFI49:
	call	insertrange
	addl	$20, %esp
.LCFI50:
.L17:
	.loc 1 92 0
	movzwl	72(%esp), %eax
	pushl	%eax
.LCFI51:
	movzwl	88(%esp), %eax
	pushl	%eax
.LCFI52:
	pushl	$.LC2
.LCFI53:
	call	printf
	addl	$12, %esp
.LCFI54:
	jmp	.L1
.L23:
.LBE11:
.LBE10:
.LBB12:
.LBB13:
	.loc 1 103 0
	movl	%esp, %edi
	cld
	movl	%esi, %eax
	movl	%ebx, %ecx
	rep
	stosl
	.loc 1 106 0
	movl	%esp, %eax
	.loc 1 105 0
	movb	$-120, 37(%esp)
	.loc 1 106 0
	pushl	%eax
.LCFI55:
	pushl	%eax
.LCFI56:
	pushl	$21
.LCFI57:
	call	*syscall
	addl	$12, %esp
.LCFI58:
	.loc 1 109 0
	testb	$1, 40(%esp)
	jne	.L24
	.loc 1 110 0
	movl	36(%esp), %eax
	testw	%ax, %ax
	je	.L21
	.loc 1 111 0
	pushl	$1
.LCFI59:
	xorl	%edx, %edx
	movzwl	%ax, %eax
	pushl	%edx
.LCFI60:
	sall	$10, %eax
	pushl	%eax
.LCFI61:
	pushl	$0
.LCFI62:
	pushl	$1048576
.LCFI63:
	call	insertrange
	addl	$20, %esp
.LCFI64:
.L21:
	.loc 1 114 0
	movzwl	36(%esp), %eax
	pushl	%eax
.LCFI65:
	pushl	$.LC3
.LCFI66:
	call	printf
	popl	%eax
.LCFI67:
	popl	%edx
.LCFI68:
	jmp	.L1
.L24:
.LBE13:
.LBE12:
	.loc 1 130 0
	pushl	$.LC4
.LCFI69:
	call	puts
	.loc 1 131 0
.LCFI70:
	call	die
.LCFI71:
.L1:
	.loc 1 135 0
	addl	$192, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
.LFE13:
	.size	get_mem, .-get_mem
	.p2align 2,,3
.globl parse_mem
	.type	parse_mem, @function
parse_mem:
.LFB14:
	.loc 1 140 0
	pushl	%ebp
.LCFI72:
	pushl	%edi
.LCFI73:
	pushl	%esi
.LCFI74:
	pushl	%ebx
.LCFI75:
	.loc 1 140 0
	pushl	%eax
.LCFI76:
	.loc 1 146 0
	cmpl	$-1, ranges+8
	.loc 1 143 0
	movl	$0, high_mem
	movl	$0, low_mem
	movl	$0, dos_mem
	.loc 1 146 0
	movl	$ranges, %esi
	je	.L48
	movl	$0, (%esp)
	xorl	%ebp, %ebp
	xorl	%edi, %edi
.L46:
	.loc 1 147 0
	cmpl	$1, 8(%esi)
	jne	.L28
	.loc 1 149 0
	movl	4(%esi), %ebx
	movl	(%esi), %ecx
	movl	%ebx, %eax
	orl	%ecx, %eax
	jne	.L30
	.loc 1 150 0
	movl	16(%esi), %edx
	cmpl	$0, %edx
	movl	12(%esi), %eax
	ja	.L32
	cmpl	$1048576, %eax
	jbe	.L31
.L32:
	.loc 1 151 0
	movl	$1048576, (%esp)
	jmp	.L30
.LCFI77:
.L31:
	.loc 1 153 0
	movl	12(%esi), %eax
	movl	%eax, (%esp)
.L30:
	.loc 1 155 0
	cmpl	$0, %ebx
	ja	.L28
	cmpl	$1048576, %ecx
	ja	.L34
	movl	16(%esi), %edx
	cmpl	$0, %edx
	movl	12(%esi), %eax
	ja	.L38
	cmpl	$1048576, %eax
	jbe	.L34
	.loc 1 156 0
	cmpl	$0, %edx
	ja	.L38
	cmpl	$16777216, %eax
	jbe	.L37
.L38:
	.loc 1 157 0
	movl	$15728640, %ebp
	jmp	.L34
.L37:
	.loc 1 159 0
	movl	12(%esi), %ebp
	subl	$1048576, %ebp
.L34:
	.loc 1 161 0
	cmpl	$0, %ebx
	ja	.L28
	cmpl	$16777216, %ecx
	ja	.L28
	movl	16(%esi), %edx
	cmpl	$0, %edx
	movl	12(%esi), %eax
	ja	.L42
	cmpl	$16777216, %eax
	jbe	.L28
.L42:
	.loc 1 162 0
	cmpl	$1, %edx
	jb	.L43
	ja	.L44
	cmpl	$0, %eax
	jbe	.L43
.L44:
	.loc 1 163 0
	movl	$-16777216, %edi
	jmp	.L28
.L43:
	.loc 1 165 0
	movl	12(%esi), %edi
	subl	$16777216, %edi
.L28:
	.loc 1 146 0
	addl	$12, %esi
	cmpl	$-1, 8(%esi)
	jne	.L46
	movl	(%esp), %eax
	movl	%edi, high_mem
	movl	%ebp, low_mem
	movl	%eax, dos_mem
.L48:
	popl	%ebp
.LCFI78:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.LFE14:
	.size	parse_mem, .-parse_mem
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
	.long	.LFB13
	.long	.LFE13-.LFB13
	.byte	0x4
	.long	.LCFI0-.LFB13
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
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0xd0
	.byte	0x83
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0xdc
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0xdc
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0xe8
	.byte	0x2e
	.uleb128 0x18
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0xdc
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0xdc
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0xdc
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI29-.LCFI28
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI32-.LCFI31
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI35-.LCFI34
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0xdc
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0xdc
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI44-.LCFI43
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI47-.LCFI46
	.byte	0xe
	.uleb128 0xdc
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI50-.LCFI49
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI51-.LCFI50
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI52-.LCFI51
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI53-.LCFI52
	.byte	0xe
	.uleb128 0xdc
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI55-.LCFI54
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0xdc
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI58-.LCFI57
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI59-.LCFI58
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI60-.LCFI59
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI61-.LCFI60
	.byte	0xe
	.uleb128 0xdc
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI62-.LCFI61
	.byte	0xe
	.uleb128 0xe0
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI63-.LCFI62
	.byte	0xe
	.uleb128 0xe4
	.byte	0x2e
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI64-.LCFI63
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI65-.LCFI64
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI66-.LCFI65
	.byte	0xe
	.uleb128 0xd8
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI67-.LCFI66
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI68-.LCFI67
	.byte	0xe
	.uleb128 0xd0
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI69-.LCFI68
	.byte	0xe
	.uleb128 0xd4
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI70-.LCFI69
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI71-.LCFI70
	.byte	0xe
	.uleb128 0xd0
	.align 4
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB14
	.long	.LFE14-.LFB14
	.byte	0x4
	.long	.LCFI72-.LFB14
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI73-.LCFI72
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI74-.LCFI73
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI75-.LCFI74
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI76-.LCFI75
	.byte	0xe
	.uleb128 0x18
	.byte	0x2e
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI77-.LCFI76
	.byte	0xe
	.uleb128 0x14
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI78-.LCFI77
	.byte	0xe
	.uleb128 0x10
	.align 4
.LEFDE2:
	.file 3 "../com32/include/stdint.h"
	.file 4 "e820.h"
	.file 5 "memdisk.h"
	.text
.Letext0:
	.section	.debug_info
	.long	0x598
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.Ldebug_line0
	.long	.Letext0
	.long	.Ltext0
	.long	.LASF46
	.byte	0x1
	.long	.LASF47
	.long	.LASF48
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
	.long	0xad
	.byte	0x4
	.byte	0x2
	.byte	0x1f
	.uleb128 0x6
	.string	"l"
	.byte	0x2
	.byte	0x1c
	.long	0x65
	.uleb128 0x6
	.string	"w"
	.byte	0x2
	.byte	0x1d
	.long	0xad
	.uleb128 0x6
	.string	"b"
	.byte	0x2
	.byte	0x1e
	.long	0xc4
	.byte	0x0
	.uleb128 0x7
	.long	0xbd
	.long	0x53
	.uleb128 0x8
	.long	0xbd
	.byte	0x1
	.byte	0x0
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x7
	.uleb128 0x7
	.long	0xd4
	.long	0x41
	.uleb128 0x8
	.long	0xbd
	.byte	0x3
	.byte	0x0
	.uleb128 0x4
	.long	.LASF11
	.byte	0x2
	.byte	0x1f
	.long	0x89
	.uleb128 0x9
	.long	0x19a
	.byte	0x2c
	.byte	0x2
	.byte	0x31
	.uleb128 0xa
	.string	"gs"
	.byte	0x2
	.byte	0x22
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.string	"fs"
	.byte	0x2
	.byte	0x23
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.string	"es"
	.byte	0x2
	.byte	0x24
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.string	"ds"
	.byte	0x2
	.byte	0x25
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.string	"edi"
	.byte	0x2
	.byte	0x27
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.string	"esi"
	.byte	0x2
	.byte	0x28
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.string	"ebp"
	.byte	0x2
	.byte	0x29
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.long	.LASF12
	.byte	0x2
	.byte	0x2a
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.string	"ebx"
	.byte	0x2
	.byte	0x2b
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.string	"edx"
	.byte	0x2
	.byte	0x2c
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.string	"ecx"
	.byte	0x2
	.byte	0x2d
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.string	"eax"
	.byte	0x2
	.byte	0x2e
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xb
	.long	.LASF13
	.byte	0x2
	.byte	0x30
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x4
	.long	.LASF14
	.byte	0x2
	.byte	0x31
	.long	0xdf
	.uleb128 0xc
	.long	0x206
	.long	.LASF23
	.byte	0x18
	.byte	0x2
	.byte	0x46
	.uleb128 0xb
	.long	.LASF15
	.byte	0x2
	.byte	0x47
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	.LASF16
	.byte	0x2
	.byte	0x48
	.long	0x206
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.long	.LASF17
	.byte	0x2
	.byte	0x49
	.long	0x23a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	.LASF18
	.byte	0x2
	.byte	0x4a
	.long	0x240
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.long	.LASF19
	.byte	0x2
	.byte	0x4b
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.long	.LASF20
	.byte	0x2
	.byte	0x4c
	.long	0x258
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x20c
	.uleb128 0x2
	.long	.LASF21
	.byte	0x1
	.byte	0x6
	.uleb128 0xe
	.long	0x229
	.byte	0x1
	.uleb128 0xf
	.long	0x41
	.uleb128 0xf
	.long	0x229
	.uleb128 0xf
	.long	0x234
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x22f
	.uleb128 0x10
	.long	0x19a
	.uleb128 0xd
	.byte	0x4
	.long	0x19a
	.uleb128 0xd
	.byte	0x4
	.long	0x213
	.uleb128 0x11
	.byte	0x4
	.uleb128 0xe
	.long	0x258
	.byte	0x1
	.uleb128 0xf
	.long	0x65
	.uleb128 0xf
	.long	0x229
	.uleb128 0xf
	.long	0x234
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x242
	.uleb128 0x4
	.long	.LASF22
	.byte	0x5
	.byte	0x1d
	.long	0x269
	.uleb128 0xd
	.byte	0x4
	.long	0x26f
	.uleb128 0xe
	.long	0x285
	.byte	0x1
	.uleb128 0xf
	.long	0x41
	.uleb128 0xf
	.long	0x234
	.uleb128 0xf
	.long	0x234
	.byte	0x0
	.uleb128 0xc
	.long	0x2ae
	.long	.LASF24
	.byte	0xc
	.byte	0x4
	.byte	0x16
	.uleb128 0xb
	.long	.LASF25
	.byte	0x4
	.byte	0x17
	.long	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	.LASF26
	.byte	0x4
	.byte	0x18
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x12
	.long	0x3de
	.byte	0x1
	.long	.LASF37
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.long	.LFB13
	.long	.LFE13
	.byte	0x1
	.byte	0x54
	.uleb128 0x13
	.long	0x347
	.long	0x3de
	.long	.LBB2
	.long	.LBE2
	.uleb128 0x14
	.long	0x426
	.byte	0x1
	.byte	0x53
	.uleb128 0x14
	.long	0x431
	.byte	0x1
	.byte	0x50
	.uleb128 0x14
	.long	0x43c
	.byte	0x1
	.byte	0x56
	.uleb128 0x14
	.long	0x447
	.byte	0x3
	.byte	0x91
	.sleb128 144
	.uleb128 0x15
	.long	.LBB3
	.long	.LBE3
	.uleb128 0x14
	.long	0x426
	.byte	0x1
	.byte	0x53
	.uleb128 0x14
	.long	0x431
	.byte	0x1
	.byte	0x50
	.uleb128 0x14
	.long	0x43c
	.byte	0x1
	.byte	0x56
	.uleb128 0x14
	.long	0x447
	.byte	0x3
	.byte	0x91
	.sleb128 144
	.uleb128 0x13
	.long	0x332
	.long	0x459
	.long	.LBB4
	.long	.LBE4
	.uleb128 0x16
	.long	0x46a
	.byte	0x0
	.uleb128 0x17
	.long	0x476
	.long	.LBB6
	.long	.LBE6
	.uleb128 0x16
	.long	0x487
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.long	0x375
	.long	0x493
	.long	.LBB8
	.long	.LBE8
	.uleb128 0x14
	.long	0x4a0
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x15
	.long	.LBB9
	.long	.LBE9
	.uleb128 0x14
	.long	0x4a0
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.long	0x3ab
	.long	0x4ac
	.long	.LBB10
	.long	.LBE10
	.uleb128 0x18
	.long	0x4bd
	.uleb128 0x14
	.long	0x4c8
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x15
	.long	.LBB11
	.long	.LBE11
	.uleb128 0x18
	.long	0x4bd
	.uleb128 0x14
	.long	0x4c8
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.long	0x4d4
	.long	.LBB12
	.long	.LBE12
	.uleb128 0x14
	.long	0x4e5
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.long	0x4f0
	.uleb128 0x15
	.long	.LBB13
	.long	.LBE13
	.uleb128 0x14
	.long	0x4e5
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.long	0x4f0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.long	0x453
	.long	.LASF32
	.byte	0x1
	.byte	0x1a
	.byte	0x1
	.long	0x33
	.byte	0x3
	.uleb128 0xc
	.long	0x426
	.long	.LASF27
	.byte	0x14
	.byte	0x1
	.byte	0x1b
	.uleb128 0xb
	.long	.LASF28
	.byte	0x1
	.byte	0x1c
	.long	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.string	"len"
	.byte	0x1
	.byte	0x1d
	.long	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	.LASF26
	.byte	0x1
	.byte	0x1e
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x1a
	.string	"buf"
	.byte	0x1
	.byte	0x1f
	.long	0x453
	.uleb128 0x1b
	.long	.LASF29
	.byte	0x1
	.byte	0x20
	.long	0x65
	.uleb128 0x1b
	.long	.LASF30
	.byte	0x1
	.byte	0x21
	.long	0x33
	.uleb128 0x1b
	.long	.LASF31
	.byte	0x1
	.byte	0x22
	.long	0x19a
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x3ef
	.uleb128 0x19
	.long	0x476
	.long	.LASF33
	.byte	0x2
	.byte	0x6b
	.byte	0x1
	.long	0x53
	.byte	0x3
	.uleb128 0x1c
	.string	"__p"
	.byte	0x2
	.byte	0x6a
	.long	0x240
	.byte	0x0
	.uleb128 0x1d
	.long	0x493
	.string	"SEG"
	.byte	0x2
	.byte	0x66
	.byte	0x1
	.long	0x53
	.byte	0x3
	.uleb128 0x1c
	.string	"__p"
	.byte	0x2
	.byte	0x65
	.long	0x240
	.byte	0x0
	.uleb128 0x1e
	.long	0x4ac
	.long	.LASF34
	.byte	0x1
	.byte	0x41
	.byte	0x1
	.byte	0x3
	.uleb128 0x1b
	.long	.LASF31
	.byte	0x1
	.byte	0x42
	.long	0x19a
	.byte	0x0
	.uleb128 0x19
	.long	0x4d4
	.long	.LASF35
	.byte	0x1
	.byte	0x4b
	.byte	0x1
	.long	0x33
	.byte	0x3
	.uleb128 0x1a
	.string	"err"
	.byte	0x1
	.byte	0x4c
	.long	0x33
	.uleb128 0x1b
	.long	.LASF31
	.byte	0x1
	.byte	0x4d
	.long	0x19a
	.byte	0x0
	.uleb128 0x19
	.long	0x4fc
	.long	.LASF36
	.byte	0x1
	.byte	0x63
	.byte	0x1
	.long	0x33
	.byte	0x3
	.uleb128 0x1b
	.long	.LASF31
	.byte	0x1
	.byte	0x64
	.long	0x19a
	.uleb128 0x1a
	.string	"err"
	.byte	0x1
	.byte	0x65
	.long	0x33
	.byte	0x0
	.uleb128 0x12
	.long	0x520
	.byte	0x1
	.long	.LASF38
	.byte	0x1
	.byte	0x8c
	.byte	0x1
	.long	.LFB14
	.long	.LFE14
	.byte	0x1
	.byte	0x54
	.uleb128 0x1f
	.string	"ep"
	.byte	0x1
	.byte	0x8d
	.long	0x520
	.byte	0x1
	.byte	0x56
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x285
	.uleb128 0x20
	.long	.LASF39
	.byte	0x2
	.byte	0x4d
	.long	0x1a5
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.long	.LASF40
	.byte	0x5
	.byte	0x1e
	.long	0x25e
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.long	.LASF41
	.byte	0x5
	.byte	0x1f
	.long	0x240
	.byte	0x1
	.byte	0x1
	.uleb128 0x7
	.long	0x558
	.long	0x285
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x20
	.long	.LASF42
	.byte	0x4
	.byte	0x1b
	.long	0x54d
	.byte	0x1
	.byte	0x1
	.uleb128 0x22
	.long	.LASF43
	.byte	0x1
	.byte	0x78
	.long	0x65
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	dos_mem
	.uleb128 0x22
	.long	.LASF44
	.byte	0x1
	.byte	0x79
	.long	0x65
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	low_mem
	.uleb128 0x22
	.long	.LASF45
	.byte	0x1
	.byte	0x7a
	.long	0x65
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	high_mem
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0x21
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
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
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x4d
	.value	0x2
	.long	.Ldebug_info0
	.long	0x59c
	.long	0x2ae
	.string	"get_mem"
	.long	0x4fc
	.string	"parse_mem"
	.long	0x565
	.string	"dos_mem"
	.long	0x577
	.string	"low_mem"
	.long	0x589
	.string	"high_mem"
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
.LASF35:
	.string	"get_e801"
.LASF33:
	.string	"OFFS"
.LASF42:
	.string	"ranges"
.LASF9:
	.string	"uint64_t"
.LASF39:
	.string	"__com32"
.LASF1:
	.string	"short int"
.LASF13:
	.string	"eflags"
.LASF20:
	.string	"cs_farcall"
.LASF19:
	.string	"cs_bounce_size"
.LASF23:
	.string	"com32_sys_args"
.LASF30:
	.string	"range_count"
.LASF4:
	.string	"uint8_t"
.LASF43:
	.string	"dos_mem"
.LASF44:
	.string	"low_mem"
.LASF36:
	.string	"get_88"
.LASF7:
	.string	"uint32_t"
.LASF29:
	.string	"copied"
.LASF34:
	.string	"get_dos_mem"
.LASF2:
	.string	"long long int"
.LASF38:
	.string	"parse_mem"
.LASF14:
	.string	"com32sys_t"
.LASF3:
	.string	"unsigned char"
.LASF46:
	.string	"GNU C 3.4.1"
.LASF41:
	.string	"sys_bounce"
.LASF0:
	.string	"signed char"
.LASF10:
	.string	"long long unsigned int"
.LASF26:
	.string	"type"
.LASF11:
	.string	"reg32_t"
.LASF8:
	.string	"unsigned int"
.LASF45:
	.string	"high_mem"
.LASF15:
	.string	"cs_sysargs"
.LASF24:
	.string	"e820range"
.LASF40:
	.string	"syscall"
.LASF25:
	.string	"start"
.LASF6:
	.string	"short unsigned int"
.LASF32:
	.string	"get_e820"
.LASF21:
	.string	"char"
.LASF5:
	.string	"uint16_t"
.LASF12:
	.string	"_unused"
.LASF27:
	.string	"e820_info"
.LASF37:
	.string	"get_mem"
.LASF48:
	.string	"/home/lfs-kable/bootcd/extra/syslinux-3.09/memdisk"
.LASF47:
	.string	"msetup.c"
.LASF17:
	.string	"cs_intcall"
.LASF22:
	.string	"syscall_t"
.LASF16:
	.string	"cs_cmdline"
.LASF18:
	.string	"cs_bounce"
.LASF28:
	.string	"base"
.LASF31:
	.string	"regs"
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.4.1"
