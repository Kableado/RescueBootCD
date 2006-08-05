	.file	"e820func.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.ident	"$Id: e820func.c,v 1.7 2004/12/14 22:46:25 hpa Exp $"
	.ident	"$Id: memdisk.h,v 1.9 2005/03/08 18:39:32 hpa Exp $"
	.ident	"$Id: e820.h,v 1.4 2004/12/14 22:46:25 hpa Exp $"
	.p2align 2,,3
.globl e820map_init
	.type	e820map_init, @function
e820map_init:
.LFB9:
	.file 1 "e820func.c"
	.loc 1 31 0
	.loc 1 32 0
	pushl	$768
.LCFI0:
	pushl	$0
.LCFI1:
	pushl	$ranges
.LCFI2:
	call	memset
	.loc 1 34 0
	addl	$12, %esp
.LCFI3:
	.loc 1 33 0
	movl	$1, nranges
	.loc 1 34 0
	movl	$-1, ranges+20
	ret
.LFE9:
	.size	e820map_init, .-e820map_init
	.p2align 2,,3
	.type	insertrange_at, @function
insertrange_at:
.LFB10:
	.loc 1 38 0
	pushl	%esi
.LCFI4:
	pushl	%ebx
.LCFI5:
	.loc 1 41 0
	movl	nranges, %ebx
	cmpl	%eax, %ebx
	.loc 1 38 0
	movl	%eax, %esi
	.loc 1 41 0
	movl	%ebx, %ecx
	jle	.L8
	imull	$12, %ebx, %edx
.L6:
	.loc 1 42 0
	movl	ranges-12(%edx), %eax
	movl	%eax, ranges(%edx)
	movl	ranges-8(%edx), %eax
	movl	%eax, ranges+4(%edx)
	.loc 1 41 0
	decl	%ecx
	.loc 1 42 0
	movl	ranges-4(%edx), %eax
	movl	%eax, ranges+8(%edx)
	subl	$12, %edx
	.loc 1 41 0
	cmpl	%esi, %ecx
	jg	.L6
.L8:
	.loc 1 44 0
	imull	$12, %esi, %ecx
	movl	12(%esp), %eax
	movl	%eax, ranges(%ecx)
	.loc 1 45 0
	movl	20(%esp), %eax
	.loc 1 44 0
	movl	16(%esp), %edx
	.loc 1 45 0
	movl	%eax, ranges+8(%ecx)
	.loc 1 47 0
	leal	1(%ebx), %eax
	.loc 1 49 0
	popl	%ebx
	.loc 1 47 0
	movl	%eax, nranges
	.loc 1 49 0
	popl	%esi
	.loc 1 48 0
	imull	$12, %eax, %eax
	.loc 1 44 0
	movl	%edx, ranges+4(%ecx)
	.loc 1 49 0
	movl	$-1, ranges+8(%eax)
	.loc 1 48 0
	movl	$0, ranges(%eax)
	movl	$0, ranges+4(%eax)
	.loc 1 49 0
	ret
.LFE10:
	.size	insertrange_at, .-insertrange_at
	.p2align 2,,3
.globl insertrange
	.type	insertrange, @function
insertrange:
.LFB11:
	.loc 1 53 0
	pushl	%ebp
.LCFI6:
	pushl	%edi
.LCFI7:
	pushl	%esi
.LCFI8:
	pushl	%ebx
.LCFI9:
	.loc 1 53 0
	movl	32(%esp), %edx
	movl	28(%esp), %eax
	.loc 1 59 0
	movl	%edx, %ecx
	orl	%eax, %ecx
	je	.L9
	.loc 1 62 0
	movl	20(%esp), %ebx
	addl	%eax, %ebx
	movl	24(%esp), %esi
	adcl	%edx, %esi
	addl	$-1, %ebx
	adcl	$-1, %esi
	.loc 1 65 0
	movl	$-2, %ebp
	.loc 1 64 0
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	.loc 1 66 0
	jmp	.L11
.L14:
	.loc 1 67 0
	movl	%eax, %ebp
	.loc 1 68 0
	incl	%edi
	addl	$12, %ecx
.L11:
	movl	ranges+4(%ecx), %edx
	cmpl	%edx, 24(%esp)
	movl	ranges(%ecx), %eax
	jb	.L12
	ja	.L13
	cmpl	%eax, 20(%esp)
	jbe	.L12
.L13:
	movl	ranges+8(%ecx), %eax
	cmpl	$-1, %eax
	jne	.L14
.L12:
	.loc 1 73 0
	imull	$12, %edi, %ecx
	movl	ranges+4(%ecx), %edx
	cmpl	%edx, 24(%esp)
	movl	ranges(%ecx), %eax
	jb	.L16
	ja	.L17
	cmpl	%eax, 20(%esp)
	jb	.L16
.L17:
	cmpl	$-1, ranges+8(%ecx)
	jne	.L15
.L16:
	.loc 1 74 0
	pushl	36(%esp)
.LCFI10:
	pushl	28(%esp)
.LCFI11:
	movl	%edi, %eax
	pushl	28(%esp)
.LCFI12:
	call	insertrange_at
	incl	%edi
	addl	$12, %esp
.LCFI13:
.L15:
	.loc 1 79 0
	testl	%edi, %edi
	je	.L32
	imull	$12, %edi, %eax
	movl	ranges+4(%eax), %edx
	movl	ranges(%eax), %eax
	addl	$-1, %eax
	adcl	$-1, %edx
	cmpl	%edx, %esi
	ja	.L32
	jb	.L19
	cmpl	%eax, %ebx
	jbe	.L19
.L32:
	imull	$12, %edi, %ecx
.L38:
	.loc 1 78 0
	movl	36(%esp), %eax
	.loc 1 77 0
	movl	ranges+8(%ecx), %ebp
	.loc 1 78 0
	movl	%eax, ranges+8(%ecx)
	addl	$12, %ecx
	.loc 1 79 0
	incl	%edi
	je	.L38
	movl	ranges(%ecx), %eax
	addl	$-1, %eax
	movl	ranges+4(%ecx), %edx
	adcl	$-1, %edx
	cmpl	%edx, %esi
	ja	.L38
	jb	.L19
	cmpl	%eax, %ebx
	ja	.L38
.L19:
	.loc 1 82 0
	imull	$12, %edi, %eax
	movl	ranges+4(%eax), %edx
	movl	ranges(%eax), %eax
	addl	$-1, %eax
	adcl	$-1, %edx
	cmpl	%edx, %esi
	ja	.L23
	jb	.L24
	cmpl	%eax, %ebx
	jae	.L23
.L24:
	.loc 1 83 0
	addl	$1, %ebx
	pushl	%ebp
.LCFI14:
	adcl	$0, %esi
	pushl	%esi
.LCFI15:
	pushl	%ebx
.LCFI16:
	movl	%edi, %eax
	call	insertrange_at
	addl	$12, %esp
.LCFI17:
.L23:
	.loc 1 87 0
	movl	$1, %ebx
	.loc 1 96 0
	movl	nranges, %esi
	cmpl	%esi, %ebx
	.loc 1 87 0
	movl	$1, %edi
	.loc 1 88 0
	movl	ranges+8, %ebp
	.loc 1 96 0
	jge	.L34
	movl	$12, %ecx
.L30:
	.loc 1 90 0
	imull	$12, %edi, %edx
	movl	ranges+8(%edx), %eax
	cmpl	%ebp, %eax
	jne	.L27
	.loc 1 91 0
	incl	%edi
	jmp	.L25
.L27:
	.loc 1 94 0
	cmpl	%ebx, %edi
	.loc 1 93 0
	movl	%eax, %ebp
	.loc 1 94 0
	je	.L29
	.loc 1 95 0
	movl	ranges(%edx), %eax
	movl	%eax, ranges(%ecx)
	movl	ranges+4(%edx), %eax
	movl	%eax, ranges+4(%ecx)
	movl	ranges+8(%edx), %eax
	movl	%eax, ranges+8(%ecx)
.L29:
	.loc 1 96 0
	incl	%edi
	incl	%ebx
	addl	$12, %ecx
.L25:
	cmpl	%esi, %edi
	jl	.L30
.L34:
	.loc 1 100 0
	cmpl	%ebx, %edi
	je	.L9
	.loc 1 101 0
	imull	$12, %edi, %edx
	movl	ranges(%edx), %eax
	imull	$12, %ebx, %ecx
	movl	%eax, ranges(%ecx)
	movl	ranges+4(%edx), %eax
	movl	%eax, ranges+4(%ecx)
	movl	ranges+8(%edx), %eax
	.loc 1 102 0
	subl	%ebx, %edi
	.loc 1 101 0
	movl	%eax, ranges+8(%ecx)
	.loc 1 102 0
	subl	%edi, nranges
.L9:
	.loc 1 104 0
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.LFE11:
	.size	insertrange, .-insertrange
	.comm	ranges,768,32
	.comm	nranges,4,4
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
	.long	.LFB9
	.long	.LFE9-.LFB9
	.byte	0x4
	.long	.LCFI0-.LFB9
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
	.byte	0xe
	.uleb128 0x10
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x4
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB10
	.long	.LFE10-.LFB10
	.byte	0x4
	.long	.LCFI4-.LFB10
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0xc
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.align 4
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB11
	.long	.LFE11-.LFB11
	.byte	0x4
	.long	.LCFI6-.LFB11
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI9-.LCFI8
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
	.long	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x18
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x1c
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x20
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x14
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x18
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x1c
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x20
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x14
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE4:
	.file 2 "../com32/include/stdint.h"
	.file 3 "../com32/include/com32.h"
	.file 4 "e820.h"
	.text
.Letext0:
	.section	.debug_info
	.long	0x3a1
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.Ldebug_line0
	.long	.Letext0
	.long	.Ltext0
	.long	.LASF32
	.byte	0x1
	.long	.LASF33
	.long	.LASF34
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
	.byte	0x2
	.byte	0xf
	.long	0x4c
	.uleb128 0x2
	.long	.LASF3
	.byte	0x1
	.byte	0x8
	.uleb128 0x4
	.long	.LASF5
	.byte	0x2
	.byte	0x10
	.long	0x5e
	.uleb128 0x2
	.long	.LASF6
	.byte	0x2
	.byte	0x7
	.uleb128 0x4
	.long	.LASF7
	.byte	0x2
	.byte	0x11
	.long	0x70
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x7
	.uleb128 0x4
	.long	.LASF9
	.byte	0x2
	.byte	0x12
	.long	0x82
	.uleb128 0x2
	.long	.LASF10
	.byte	0x8
	.byte	0x7
	.uleb128 0x5
	.long	0xad
	.byte	0x4
	.byte	0x3
	.byte	0x1f
	.uleb128 0x6
	.string	"l"
	.byte	0x3
	.byte	0x1c
	.long	0x65
	.uleb128 0x6
	.string	"w"
	.byte	0x3
	.byte	0x1d
	.long	0xad
	.uleb128 0x6
	.string	"b"
	.byte	0x3
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
	.byte	0x3
	.byte	0x1f
	.long	0x89
	.uleb128 0x9
	.long	0x19a
	.byte	0x2c
	.byte	0x3
	.byte	0x31
	.uleb128 0xa
	.string	"gs"
	.byte	0x3
	.byte	0x22
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.string	"fs"
	.byte	0x3
	.byte	0x23
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.string	"es"
	.byte	0x3
	.byte	0x24
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.string	"ds"
	.byte	0x3
	.byte	0x25
	.long	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.string	"edi"
	.byte	0x3
	.byte	0x27
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.string	"esi"
	.byte	0x3
	.byte	0x28
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.string	"ebp"
	.byte	0x3
	.byte	0x29
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.long	.LASF12
	.byte	0x3
	.byte	0x2a
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.string	"ebx"
	.byte	0x3
	.byte	0x2b
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.string	"edx"
	.byte	0x3
	.byte	0x2c
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.string	"ecx"
	.byte	0x3
	.byte	0x2d
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.string	"eax"
	.byte	0x3
	.byte	0x2e
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xb
	.long	.LASF13
	.byte	0x3
	.byte	0x30
	.long	0xd4
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x4
	.long	.LASF14
	.byte	0x3
	.byte	0x31
	.long	0xdf
	.uleb128 0xc
	.long	0x206
	.long	.LASF22
	.byte	0x18
	.byte	0x3
	.byte	0x46
	.uleb128 0xb
	.long	.LASF15
	.byte	0x3
	.byte	0x47
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	.LASF16
	.byte	0x3
	.byte	0x48
	.long	0x206
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.long	.LASF17
	.byte	0x3
	.byte	0x49
	.long	0x23a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	.LASF18
	.byte	0x3
	.byte	0x4a
	.long	0x240
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.long	.LASF19
	.byte	0x3
	.byte	0x4b
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.long	.LASF20
	.byte	0x3
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
	.uleb128 0xc
	.long	0x287
	.long	.LASF23
	.byte	0xc
	.byte	0x4
	.byte	0x16
	.uleb128 0xb
	.long	.LASF24
	.byte	0x4
	.byte	0x17
	.long	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	.LASF25
	.byte	0x4
	.byte	0x18
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x12
	.byte	0x1
	.long	.LASF35
	.byte	0x1
	.byte	0x1f
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.byte	0x1
	.byte	0x54
	.uleb128 0x13
	.long	0x2e8
	.long	.LASF36
	.byte	0x1
	.byte	0x26
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.byte	0x1
	.byte	0x54
	.uleb128 0x14
	.long	.LASF26
	.byte	0x1
	.byte	0x25
	.long	0x33
	.byte	0x1
	.byte	0x56
	.uleb128 0x14
	.long	.LASF24
	.byte	0x1
	.byte	0x25
	.long	0x77
	.byte	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x14
	.long	.LASF25
	.byte	0x1
	.byte	0x25
	.long	0x65
	.byte	0x1
	.byte	0x50
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x27
	.long	0x33
	.byte	0x1
	.byte	0x51
	.byte	0x0
	.uleb128 0x16
	.long	0x363
	.byte	0x1
	.long	.LASF37
	.byte	0x1
	.byte	0x35
	.byte	0x1
	.long	.LFB11
	.long	.LFE11
	.byte	0x1
	.byte	0x54
	.uleb128 0x14
	.long	.LASF24
	.byte	0x1
	.byte	0x34
	.long	0x77
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x17
	.string	"len"
	.byte	0x1
	.byte	0x34
	.long	0x77
	.byte	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x14
	.long	.LASF25
	.byte	0x1
	.byte	0x34
	.long	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x18
	.long	.LASF27
	.byte	0x1
	.byte	0x36
	.long	0x77
	.byte	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x54
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x18
	.long	.LASF28
	.byte	0x1
	.byte	0x37
	.long	0x65
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x38
	.long	0x33
	.byte	0x1
	.byte	0x57
	.uleb128 0x15
	.string	"j"
	.byte	0x1
	.byte	0x38
	.long	0x33
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.uleb128 0x19
	.long	.LASF29
	.byte	0x3
	.byte	0x4d
	.long	0x1a5
	.byte	0x1
	.byte	0x1
	.uleb128 0x7
	.long	0x380
	.long	0x25e
	.uleb128 0x8
	.long	0xbd
	.byte	0x3f
	.byte	0x0
	.uleb128 0x1a
	.long	.LASF30
	.byte	0x1
	.byte	0x1a
	.long	0x370
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ranges
	.uleb128 0x1a
	.long	.LASF31
	.byte	0x1
	.byte	0x1b
	.long	0x33
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	nranges
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
	.byte	0x0
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x46
	.value	0x2
	.long	.Ldebug_info0
	.long	0x3a5
	.long	0x287
	.string	"e820map_init"
	.long	0x2e8
	.string	"insertrange"
	.long	0x380
	.string	"ranges"
	.long	0x392
	.string	"nranges"
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
.LASF30:
	.string	"ranges"
.LASF15:
	.string	"cs_sysargs"
.LASF16:
	.string	"cs_cmdline"
.LASF37:
	.string	"insertrange"
.LASF17:
	.string	"cs_intcall"
.LASF12:
	.string	"_unused"
.LASF14:
	.string	"com32sys_t"
.LASF19:
	.string	"cs_bounce_size"
.LASF29:
	.string	"__com32"
.LASF9:
	.string	"uint64_t"
.LASF20:
	.string	"cs_farcall"
.LASF28:
	.string	"oldtype"
.LASF3:
	.string	"unsigned char"
.LASF24:
	.string	"start"
.LASF6:
	.string	"short unsigned int"
.LASF11:
	.string	"reg32_t"
.LASF32:
	.string	"GNU C 3.4.1"
.LASF36:
	.string	"insertrange_at"
.LASF8:
	.string	"unsigned int"
.LASF10:
	.string	"long long unsigned int"
.LASF4:
	.string	"uint8_t"
.LASF35:
	.string	"e820map_init"
.LASF2:
	.string	"long long int"
.LASF23:
	.string	"e820range"
.LASF21:
	.string	"char"
.LASF31:
	.string	"nranges"
.LASF34:
	.string	"/home/lfs-kable/bootcd/extra/syslinux-3.09/memdisk"
.LASF25:
	.string	"type"
.LASF1:
	.string	"short int"
.LASF5:
	.string	"uint16_t"
.LASF18:
	.string	"cs_bounce"
.LASF7:
	.string	"uint32_t"
.LASF13:
	.string	"eflags"
.LASF0:
	.string	"signed char"
.LASF33:
	.string	"e820func.c"
.LASF26:
	.string	"where"
.LASF27:
	.string	"last"
.LASF22:
	.string	"com32_sys_args"
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.4.1"
