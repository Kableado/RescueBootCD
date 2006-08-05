	.file	"conio.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.ident	"$Id: conio.c,v 1.8 2004/12/14 22:46:25 hpa Exp $"
	.ident	"$Id: memdisk.h,v 1.9 2005/03/08 18:39:32 hpa Exp $"
	.ident	"$Id: conio.h,v 1.5 2004/12/14 22:46:25 hpa Exp $"
	.p2align 2,,3
.globl putchar
	.type	putchar, @function
putchar:
.LFB9:
	.file 1 "conio.c"
	.loc 1 25 0
	pushl	%ebx
.LCFI0:
	subl	$48, %esp
.LCFI1:
	.loc 1 25 0
	movl	56(%esp), %ebx
	.loc 1 28 0
	cmpl	$10, %ebx
	jne	.L2
	.loc 1 30 0
	pushl	$13
.LCFI2:
	call	putchar
	popl	%eax
.LCFI3:
.L2:
	.loc 1 33 0
	movzbl	%bl, %eax
	orb	$14, %ah
	movw	%ax, 36(%esp)
	.loc 1 34 0
	pushl	$0
.LCFI4:
	leal	4(%esp), %eax
	pushl	%eax
.LCFI5:
	pushl	$16
.LCFI6:
	call	*syscall
	.loc 1 37 0
	addl	$60, %esp
	movl	%ebx, %eax
	popl	%ebx
	ret
.LCFI7:
.LFE9:
	.size	putchar, .-putchar
	.p2align 2,,3
.globl puts
	.type	puts, @function
puts:
.LFB10:
	.loc 1 40 0
	pushl	%esi
.LCFI8:
	pushl	%ebx
.LCFI9:
	.loc 1 40 0
	movl	12(%esp), %ebx
	.loc 1 41 0
	xorl	%esi, %esi
.L10:
	.loc 1 46 0
	cmpb	$0, (%ebx)
	je	.L9
	.loc 1 44 0
	movsbl	(%ebx),%eax
	pushl	%eax
.LCFI10:
	call	putchar
	.loc 1 45 0
	incl	%esi
	.loc 1 46 0
	incl	%ebx
	popl	%edx
.LCFI11:
	jmp	.L10
.L9:
	.loc 1 50 0
	popl	%ebx
	movl	%esi, %eax
	popl	%esi
	ret
.LFE10:
	.size	puts, .-puts
	.p2align 2,,3
	.type	skip_atoi, @function
skip_atoi:
.LFB12:
	.loc 1 69 0
	pushl	%esi
.LCFI12:
	pushl	%ebx
.LCFI13:
.LBB2:
	.loc 1 64 0
	movl	(%eax), %edx
.LBE2:
	.loc 1 69 0
	movl	%eax, %esi
.LBB3:
	.loc 1 64 0
	movsbl	(%edx),%eax
.LBB4:
	.loc 1 65 0
	subl	$48, %eax
.LBE4:
.LBE3:
	.loc 1 70 0
	xorl	%ebx, %ebx
	.loc 1 64 0
	cmpl	$9, %eax
	ja	.L17
	leal	1(%edx), %ecx
.L15:
	.loc 1 73 0
	movsbl	-1(%ecx),%eax
	imull	$10, %ebx, %edx
	movl	%ecx, (%esi)
.LBB5:
	.loc 1 64 0
	incl	%ecx
.LBE5:
	.loc 1 73 0
	leal	-48(%edx,%eax), %ebx
.LBB6:
	.loc 1 64 0
	movsbl	-1(%ecx),%eax
.LBB7:
	.loc 1 65 0
	subl	$48, %eax
.LBE7:
.LBE6:
	.loc 1 64 0
	cmpl	$9, %eax
	jbe	.L15
.L17:
	.loc 1 75 0
	movl	%ebx, %eax
	popl	%ebx
	popl	%esi
	ret
.LFE12:
	.size	skip_atoi, .-skip_atoi
	.p2align 2,,3
.globl atou
	.type	atou, @function
atou:
.LFB13:
	.loc 1 78 0
	pushl	%ebx
.LCFI14:
	.loc 1 78 0
	movl	8(%esp), %ecx
	.loc 1 79 0
	xorl	%ebx, %ebx
.L25:
.LBB8:
	.loc 1 64 0
	movsbl	(%ecx),%edx
.LBB9:
	.loc 1 65 0
	leal	-48(%edx), %eax
.LBE9:
.LBE8:
	.loc 1 64 0
	cmpl	$9, %eax
	ja	.L24
	.loc 1 81 0
	imull	$10, %ebx, %eax
	leal	-48(%eax,%edx), %ebx
	incl	%ecx
	jmp	.L25
.L24:
	.loc 1 83 0
	movl	%ebx, %eax
	popl	%ebx
	ret
.LFE13:
	.size	atou, .-atou
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"0123456789abcdefghijklmnopqrstuvwxyz"
.LC1:
	.string	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.text
	.p2align 2,,3
	.type	number, @function
number:
.LFB15:
	.loc 1 111 0
	pushl	%ebp
.LCFI15:
	pushl	%edi
.LCFI16:
	pushl	%esi
.LCFI17:
	pushl	%ebx
.LCFI18:
	subl	$108, %esp
.LCFI19:
	.loc 1 111 0
	movl	140(%esp), %ebp
	.loc 1 116 0
	testl	$64, %ebp
	.loc 1 111 0
	movl	%eax, %esi
	movl	%edx, %edi
	movl	132(%esp), %ebx
	.loc 1 113 0
	movl	$.LC0, 4(%esp)
	.loc 1 116 0
	je	.L27
	.loc 1 117 0
	movl	$.LC1, 4(%esp)
.L27:
	.loc 1 118 0
	testl	$16, %ebp
	je	.L28
	.loc 1 119 0
	andl	$-2, %ebp
.L28:
	.loc 1 120 0
	movl	128(%esp), %eax
	subl	$2, %eax
	.loc 1 121 0
	xorl	%edx, %edx
	.loc 1 120 0
	cmpl	$34, %eax
	ja	.L26
	.loc 1 122 0
	movl	%ebp, %eax
	andl	$1, %eax
	cmpl	$1, %eax
	sbbl	%eax, %eax
	andl	$-16, %eax
	addl	$48, %eax
	.loc 1 124 0
	testl	$2, %ebp
	.loc 1 122 0
	movb	%al, 12(%esp)
	.loc 1 123 0
	movb	$0, 11(%esp)
	.loc 1 124 0
	je	.L32
	.loc 1 125 0
	testl	%edi, %edi
	jns	.L33
	.loc 1 127 0
	negl	%edi
	.loc 1 126 0
	movb	$45, 11(%esp)
	jmp	.L79
.L33:
	.loc 1 129 0
	testl	$4, %ebp
	je	.L35
	.loc 1 130 0
	movb	$43, 11(%esp)
	jmp	.L79
.L35:
	.loc 1 132 0
	testl	$8, %ebp
	je	.L32
	.loc 1 133 0
	movb	$32, 11(%esp)
.L79:
	.loc 1 134 0
	decl	%ebx
.L32:
	.loc 1 137 0
	testl	$32, %ebp
	je	.L38
	.loc 1 138 0
	cmpl	$16, 128(%esp)
	jne	.L39
	.loc 1 139 0
	subl	$2, %ebx
	jmp	.L38
.L39:
	.loc 1 140 0
	cmpl	$8, 128(%esp)
	jne	.L38
	.loc 1 141 0
	decl	%ebx
.L38:
	.loc 1 144 0
	testl	%edi, %edi
	.loc 1 143 0
	movl	$0, (%esp)
	.loc 1 144 0
	jne	.L46
	.loc 1 145 0
	movb	$48, 28(%esp)
	movl	$1, (%esp)
	jmp	.L43
.L46:
.LBB10:
	.loc 1 147 0
	movl	%edi, %eax
	xorl	%edx, %edx
	divl	128(%esp)
.LBE10:
	leal	108(%esp), %ecx
	addl	(%esp), %ecx
.LBB11:
	movl	%eax, %edi
	incl	(%esp)
.LBE11:
	movl	4(%esp), %eax
	movb	(%eax,%edx), %dl
	testl	%edi, %edi
	movb	%dl, -80(%ecx)
	jne	.L46
.L43:
	.loc 1 148 0
	movl	136(%esp), %edx
	cmpl	%edx, (%esp)
	jle	.L47
	.loc 1 149 0
	movl	(%esp), %eax
	movl	%eax, 136(%esp)
.L47:
	.loc 1 150 0
	subl	136(%esp), %ebx
	.loc 1 151 0
	testl	$17, %ebp
	jne	.L48
.L80:
	.loc 1 153 0
	movl	%ebx, %eax
	decl	%ebx
	testl	%eax, %eax
	jle	.L48
	movb	$32, (%esi)
	incl	%esi
	jmp	.L80
.L48:
	.loc 1 154 0
	cmpb	$0, 11(%esp)
	je	.L52
	.loc 1 155 0
	movb	11(%esp), %dl
	movb	%dl, (%esi)
	incl	%esi
.L52:
	.loc 1 156 0
	testl	$32, %ebp
	je	.L53
	.loc 1 157 0
	cmpl	$8, 128(%esp)
	jne	.L54
	.loc 1 158 0
	movb	$48, (%esi)
	jmp	.L81
.L54:
	.loc 1 159 0
	cmpl	$16, 128(%esp)
	jne	.L53
	.loc 1 160 0
	movb	$48, (%esi)
	.loc 1 161 0
	movl	4(%esp), %edx
	.loc 1 160 0
	incl	%esi
	.loc 1 161 0
	movb	33(%edx), %al
	movb	%al, (%esi)
.L81:
	incl	%esi
.L53:
	.loc 1 164 0
	andl	$16, %ebp
	jne	.L57
.L82:
	.loc 1 166 0
	movl	%ebx, %eax
	decl	%ebx
	testl	%eax, %eax
	jle	.L57
	movb	12(%esp), %al
	movb	%al, (%esi)
	incl	%esi
	jmp	.L82
.L57:
	.loc 1 168 0
	movl	136(%esp), %eax
	decl	136(%esp)
	cmpl	(%esp), %eax
	jle	.L74
	movb	$48, (%esi)
	incl	%esi
	jmp	.L57
.L74:
	.loc 1 170 0
	movl	(%esp), %eax
	decl	(%esp)
.L83:
	testl	%eax, %eax
	jle	.L76
	movl	(%esp), %edx
	movb	28(%esp,%edx), %al
	movb	%al, (%esi)
	movl	%edx, %eax
	incl	%esi
	decl	%edx
	movl	%edx, (%esp)
	jmp	.L83
.L76:
	.loc 1 172 0
	movl	%ebx, %eax
	decl	%ebx
	testl	%eax, %eax
	jle	.L78
	movb	$32, (%esi)
	incl	%esi
	jmp	.L76
.L78:
	.loc 1 173 0
	movl	%esi, %edx
.L26:
	.loc 1 174 0
	addl	$108, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	movl	%edx, %eax
	popl	%ebp
	ret
.LFE15:
	.size	number, .-number
	.p2align 2,,3
.globl vsprintf
	.type	vsprintf, @function
vsprintf:
.LFB16:
	.loc 1 180 0
	pushl	%ebp
.LCFI20:
	pushl	%edi
.LCFI21:
	pushl	%esi
.LCFI22:
	pushl	%ebx
.LCFI23:
	.loc 1 180 0
	pushl	%esi
.LCFI24:
	pushl	%esi
.LCFI25:
	.loc 1 194 0
	movl	32(%esp), %eax
	.loc 1 180 0
	movl	36(%esp), %esi
	.loc 1 194 0
	movl	28(%esp), %ebx
	cmpb	$0, (%eax)
.L177:
	je	.L162
	.loc 1 195 0
	movl	32(%esp), %eax
	movb	(%eax), %al
	cmpb	$37, %al
	je	.L88
	.loc 1 196 0
	movb	%al, (%ebx)
	jmp	.L185
.LCFI26:
.L88:
	.loc 1 201 0
	movl	$0, 4(%esp)
.L89:
.L187:
	.loc 1 203 0
	movl	32(%esp), %eax
	leal	1(%eax), %ecx
	movl	%ecx, 32(%esp)
	.loc 1 204 0
	movsbl	1(%eax),%eax
	cmpl	$43, %eax
	je	.L92
	jg	.L96
	cmpl	$32, %eax
	je	.L93
	cmpl	$35, %eax
	je	.L94
	jmp	.L90
.L96:
	cmpl	$45, %eax
	je	.L91
	cmpl	$48, %eax
	je	.L95
	jmp	.L90
.L91:
	.loc 1 205 0
	orl	$16, 4(%esp)
	jmp	.L187
.L92:
	.loc 1 206 0
	orl	$4, 4(%esp)
	jmp	.L187
.L93:
	.loc 1 207 0
	orl	$8, 4(%esp)
	jmp	.L187
.L94:
	.loc 1 208 0
	orl	$32, 4(%esp)
	jmp	.L187
.L95:
	.loc 1 209 0
	orl	$1, 4(%esp)
	jmp	.L187
.L90:
.LBB12:
	.loc 1 64 0
	movb	(%ecx), %dl
	movsbl	%dl,%eax
.LBB13:
	.loc 1 65 0
	subl	$48, %eax
.LBE13:
.LBE12:
	.loc 1 213 0
	orl	$-1, %edi
	.loc 1 64 0
	cmpl	$9, %eax
	ja	.L97
	.loc 1 215 0
	leal	32(%esp), %eax
	call	skip_atoi
	movl	%eax, %edi
	jmp	.L99
.L97:
	.loc 1 216 0
	cmpb	$42, %dl
	jne	.L99
	.loc 1 217 0
	leal	1(%ecx), %eax
	movl	%eax, 32(%esp)
	.loc 1 219 0
	movl	%esi, %eax
	movl	(%eax), %edi
	addl	$4, %esi
	.loc 1 220 0
	testl	%edi, %edi
	jns	.L99
	.loc 1 221 0
	negl	%edi
	.loc 1 222 0
	orl	$16, 4(%esp)
.L99:
	.loc 1 227 0
	movl	$-1, (%esp)
	.loc 1 228 0
	movl	32(%esp), %edx
	cmpb	$46, (%edx)
	jne	.L102
	.loc 1 229 0
	leal	1(%edx), %eax
	movl	%eax, 32(%esp)
.LBB14:
	.loc 1 64 0
	movb	1(%edx), %cl
	movsbl	%cl,%eax
.LBB15:
	.loc 1 65 0
	subl	$48, %eax
.LBE15:
.LBE14:
	.loc 1 64 0
	cmpl	$9, %eax
	ja	.L103
	.loc 1 231 0
	leal	32(%esp), %eax
	call	skip_atoi
	jmp	.L178
.L103:
	.loc 1 232 0
	cmpb	$42, %cl
	jne	.L172
	.loc 1 233 0
	leal	2(%edx), %eax
	movl	%eax, 32(%esp)
	.loc 1 235 0
	movl	%esi, %eax
	movl	(%eax), %eax
	addl	$4, %esi
.L178:
	movl	%eax, (%esp)
	.loc 1 237 0
	cmpl	$0, (%esp)
	jns	.L102
.L172:
	.loc 1 238 0
	movl	$0, (%esp)
.L102:
	.loc 1 243 0
	movl	32(%esp), %eax
	movb	(%eax), %dl
	.loc 1 242 0
	orl	$-1, %ecx
	.loc 1 243 0
	cmpb	$104, %dl
	je	.L109
	cmpb	$108, %dl
	je	.L109
	cmpb	$76, %dl
	jne	.L108
.L109:
	.loc 1 244 0
	movsbl	(%eax),%ecx
	.loc 1 245 0
	incl	%eax
	movl	%eax, 32(%esp)
.L108:
	.loc 1 251 0
	movl	32(%esp), %eax
	movsbl	(%eax),%eax
	cmpl	$110, %eax
	.loc 1 249 0
	movl	$10, %ebp
	.loc 1 251 0
	je	.L137
	jg	.L150
	cmpl	$99, %eax
	je	.L111
	jg	.L151
	cmpl	$37, %eax
	je	.L140
	cmpl	$88, %eax
	je	.L142
	jmp	.L147
.L151:
	cmpl	$100, %eax
	je	.L145
	cmpl	$105, %eax
	je	.L145
	jmp	.L147
.L150:
	cmpl	$115, %eax
	je	.L119
	jg	.L152
	cmpl	$111, %eax
	je	.L141
	cmpl	$112, %eax
	je	.L135
	jmp	.L147
.L152:
	cmpl	$117, %eax
	je	.L110
	cmpl	$120, %eax
	je	.L143
	jmp	.L147
.L111:
	.loc 1 253 0
	testb	$16, 4(%esp)
	jne	.L112
.L179:
	.loc 1 255 0
	decl	%edi
	testl	%edi, %edi
	jle	.L112
	movb	$32, (%ebx)
	incl	%ebx
	jmp	.L179
.L112:
	.loc 1 256 0
	movl	%esi, %eax
	movl	(%eax), %eax
	addl	$4, %esi
	movb	%al, (%ebx)
.L180:
	.loc 1 258 0
	decl	%edi
	.loc 1 256 0
	incl	%ebx
	.loc 1 258 0
	testl	%edi, %edi
	jle	.L87
	movb	$32, (%ebx)
	jmp	.L180
.L119:
	.loc 1 262 0
	movl	%esi, %eax
	movl	(%eax), %ebp
	addl	$4, %esi
.LBB16:
	.loc 1 86 0
	movl	(%esp), %edx
.LBB17:
	.loc 1 87 0
	movl	%ebp, %eax
	.loc 1 89 0
	cmpb	$0, (%ebp)
	jmp	.L182
.L181:
	testl	%edx, %edx
	je	.L121
	incl	%eax
	decl	%edx
	cmpb	$0, (%eax)
.L182:
	jne	.L181
.L121:
	.loc 1 90 0
	movl	%eax, %ecx
	subl	%ebp, %ecx
.LBE17:
.LBE16:
	.loc 1 265 0
	testb	$16, 4(%esp)
	jne	.L124
.L183:
	.loc 1 267 0
	movl	%edi, %eax
	decl	%edi
	cmpl	%ecx, %eax
	jle	.L124
	movb	$32, (%ebx)
	incl	%ebx
	jmp	.L183
.L124:
	.loc 1 268 0
	testl	%ecx, %ecx
	jle	.L169
	movl	%ecx, %edx
.L131:
	.loc 1 269 0
	movb	(%ebp), %al
	movb	%al, (%ebx)
	incl	%ebp
	incl	%ebx
	decl	%edx
	jne	.L131
.L169:
	.loc 1 271 0
	movl	%edi, %eax
	decl	%edi
	cmpl	%ecx, %eax
	jle	.L87
	movb	$32, (%ebx)
	incl	%ebx
	jmp	.L169
.L135:
	.loc 1 275 0
	cmpl	$-1, %edi
	jne	.L136
	.loc 1 276 0
	movl	$8, %edi
	.loc 1 277 0
	orl	$1, 4(%esp)
.L136:
	.loc 1 279 0
	pushl	4(%esp)
.LCFI27:
	pushl	4(%esp)
.LCFI28:
	pushl	%edi
.LCFI29:
	movl	%esi, %eax
	pushl	$16
.LCFI30:
	addl	$4, %esi
	movl	(%eax), %edx
	jmp	.L186
.LCFI31:
.L137:
.LBB18:
	.loc 1 290 0
	movl	%esi, %eax
	movl	(%eax), %edx
	leal	4(%esi), %ecx
	.loc 1 291 0
	movl	%ebx, %eax
	subl	28(%esp), %eax
	.loc 1 290 0
	movl	%ecx, %esi
	.loc 1 291 0
	movl	%eax, (%edx)
.LBE18:
	.loc 1 293 0
	jmp	.L87
.L140:
	.loc 1 296 0
	movb	$37, (%ebx)
	jmp	.L185
.L141:
	.loc 1 301 0
	movl	$8, %ebp
	.loc 1 302 0
	jmp	.L110
.L142:
	.loc 1 305 0
	orl	$64, 4(%esp)
.L143:
	.loc 1 307 0
	movl	$16, %ebp
	.loc 1 308 0
	jmp	.L110
.L145:
	.loc 1 312 0
	orl	$2, 4(%esp)
	.loc 1 314 0
	jmp	.L110
.L147:
	.loc 1 317 0
	movb	$37, (%ebx)
	.loc 1 318 0
	movl	32(%esp), %eax
	movb	(%eax), %dl
	.loc 1 317 0
	incl	%ebx
	.loc 1 318 0
	testb	%dl, %dl
	je	.L148
	.loc 1 319 0
	movb	%dl, (%ebx)
.L185:
	incl	%ebx
	jmp	.L87
.L148:
	.loc 1 321 0
	decl	%eax
	movl	%eax, 32(%esp)
	.loc 1 322 0
	jmp	.L87
.L110:
	.loc 1 324 0
	cmpl	$108, %ecx
	jne	.L153
	.loc 1 325 0
	movl	%esi, %eax
	addl	$4, %esi
	jmp	.L184
.L153:
	.loc 1 326 0
	cmpl	$104, %ecx
	jne	.L155
	.loc 1 327 0
	movl	%esi, %eax
	addl	$4, %esi
	.loc 1 328 0
	testb	$2, 4(%esp)
	.loc 1 327 0
	movzwl	(%eax), %edx
	.loc 1 328 0
	je	.L154
	.loc 1 329 0
	movswl	%dx,%edx
	jmp	.L154
.L155:
	leal	4(%esi), %ecx
	.loc 1 333 0
	movl	%esi, %eax
	movl	%ecx, %esi
.L184:
	movl	(%eax), %edx
.L154:
	.loc 1 334 0
	pushl	4(%esp)
.LCFI32:
	pushl	4(%esp)
.LCFI33:
	pushl	%edi
.LCFI34:
	pushl	%ebp
.LCFI35:
.L186:
	movl	%ebx, %eax
	call	number
	movl	%eax, %ebx
	.loc 1 194 0
	addl	$16, %esp
.LCFI36:
.L87:
	movl	32(%esp), %edx
	leal	1(%edx), %eax
	movl	%eax, 32(%esp)
	cmpb	$0, 1(%edx)
	jmp	.L177
.L162:
	.loc 1 336 0
	movb	$0, (%ebx)
	.loc 1 337 0
	subl	28(%esp), %ebx
	.loc 1 338 0
	popl	%ecx
.LCFI37:
	movl	%ebx, %eax
	popl	%ebx
.LCFI38:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.LFE16:
	.size	vsprintf, .-vsprintf
	.p2align 2,,3
.globl sprintf
	.type	sprintf, @function
sprintf:
.LFB17:
	.loc 1 341 0
	.loc 1 345 0
	leal	12(%esp), %eax
	.loc 1 346 0
	pushl	%eax
.LCFI39:
	pushl	12(%esp)
.LCFI40:
	pushl	12(%esp)
.LCFI41:
	call	vsprintf
	.loc 1 348 0
	addl	$12, %esp
.LCFI42:
	.loc 1 349 0
	ret
.LFE17:
	.size	sprintf, .-sprintf
	.p2align 2,,3
.globl printf
	.type	printf, @function
printf:
.LFB18:
	.loc 1 352 0
	pushl	%esi
.LCFI43:
	pushl	%ebx
.LCFI44:
	subl	$1024, %esp
.LCFI45:
	.loc 1 357 0
	leal	1040(%esp), %eax
	.loc 1 358 0
	pushl	%eax
.LCFI46:
	pushl	1040(%esp)
.LCFI47:
	leal	8(%esp), %ebx
	pushl	%ebx
.LCFI48:
	call	vsprintf
	.loc 1 361 0
	pushl	%ebx
.LCFI49:
	.loc 1 358 0
	movl	%eax, %esi
	.loc 1 361 0
.LCFI50:
	call	puts
	.loc 1 364 0
	addl	$1040, %esp
	popl	%ebx
	movl	%esi, %eax
	popl	%esi
	ret
.LCFI51:
.LFE18:
	.size	printf, .-printf
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
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x38
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x3c
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x38
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x3c
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x40
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x44
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x38
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
	.long	.LCFI8-.LFB10
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0xc
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x10
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0xc
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB12
	.long	.LFE12-.LFB12
	.byte	0x4
	.long	.LCFI12-.LFB12
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0xc
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.align 4
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB13
	.long	.LFE13-.LFB13
	.byte	0x4
	.long	.LCFI14-.LFB13
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.align 4
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB15
	.long	.LFE15-.LFB15
	.byte	0x4
	.long	.LCFI15-.LFB15
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x80
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB16
	.long	.LFE16-.LFB16
	.byte	0x4
	.long	.LCFI20-.LFB16
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x18
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x1c
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
	.long	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x14
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x18
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x1c
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI29-.LCFI28
	.byte	0xe
	.uleb128 0x20
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0x24
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x14
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI32-.LCFI31
	.byte	0xe
	.uleb128 0x18
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x1c
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x20
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI35-.LCFI34
	.byte	0xe
	.uleb128 0x24
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x14
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0xc
	.align 4
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB17
	.long	.LFE17-.LFB17
	.byte	0x4
	.long	.LCFI39-.LFB17
	.byte	0xe
	.uleb128 0x8
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0xc
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0x10
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x4
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB18
	.long	.LFE18-.LFB18
	.byte	0x4
	.long	.LCFI43-.LFB18
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	.LCFI44-.LCFI43
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0x40c
	.byte	0x4
	.long	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0x410
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI47-.LCFI46
	.byte	0xe
	.uleb128 0x414
	.byte	0x2e
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0x418
	.byte	0x2e
	.uleb128 0xc
	.byte	0x4
	.long	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0x41c
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI50-.LCFI49
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI51-.LCFI50
	.byte	0xe
	.uleb128 0x40c
	.byte	0x2e
	.uleb128 0x0
	.align 4
.LEFDE14:
	.file 2 "../com32/include/com32.h"
	.file 3 "../com32/include/stdint.h"
	.file 4 "/usr/lib/gcc/i686-pc-linux-gnu/3.4.1/include/stdarg.h"
	.file 5 "memdisk.h"
	.text
.Letext0:
	.section	.debug_info
	.long	0x6e7
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.Ldebug_line0
	.long	.Letext0
	.long	.Ltext0
	.long	.LASF54
	.byte	0x1
	.long	.LASF55
	.long	.LASF56
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
	.long	0xa2
	.uleb128 0x6
	.string	"b"
	.byte	0x2
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
	.byte	0x2
	.byte	0x1f
	.long	0x7e
	.uleb128 0x9
	.long	0x18f
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
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.string	"esi"
	.byte	0x2
	.byte	0x28
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.string	"ebp"
	.byte	0x2
	.byte	0x29
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.long	.LASF11
	.byte	0x2
	.byte	0x2a
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.string	"ebx"
	.byte	0x2
	.byte	0x2b
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.string	"edx"
	.byte	0x2
	.byte	0x2c
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.string	"ecx"
	.byte	0x2
	.byte	0x2d
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xa
	.string	"eax"
	.byte	0x2
	.byte	0x2e
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xb
	.long	.LASF12
	.byte	0x2
	.byte	0x30
	.long	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x4
	.long	.LASF13
	.byte	0x2
	.byte	0x31
	.long	0xd4
	.uleb128 0xc
	.long	0x1fb
	.long	.LASF57
	.byte	0x18
	.byte	0x2
	.byte	0x46
	.uleb128 0xb
	.long	.LASF14
	.byte	0x2
	.byte	0x47
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	.LASF15
	.byte	0x2
	.byte	0x48
	.long	0x1fb
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.long	.LASF16
	.byte	0x2
	.byte	0x49
	.long	0x22f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	.LASF17
	.byte	0x2
	.byte	0x4a
	.long	0x235
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.long	.LASF18
	.byte	0x2
	.byte	0x4b
	.long	0x65
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.long	.LASF19
	.byte	0x2
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
	.uleb128 0x4
	.long	.LASF21
	.byte	0x5
	.byte	0x1d
	.long	0x25e
	.uleb128 0xd
	.byte	0x4
	.long	0x264
	.uleb128 0xe
	.long	0x27a
	.byte	0x1
	.uleb128 0xf
	.long	0x41
	.uleb128 0xf
	.long	0x229
	.uleb128 0xf
	.long	0x229
	.byte	0x0
	.uleb128 0x4
	.long	.LASF22
	.byte	0x4
	.byte	0x2b
	.long	0x285
	.uleb128 0xd
	.byte	0x4
	.long	0x201
	.uleb128 0x4
	.long	.LASF23
	.byte	0x4
	.byte	0x69
	.long	0x27a
	.uleb128 0x12
	.long	0x2cc
	.byte	0x1
	.long	.LASF24
	.byte	0x1
	.byte	0x19
	.byte	0x1
	.long	0x33
	.long	.LFB9
	.long	.LFE9
	.byte	0x1
	.byte	0x54
	.uleb128 0x13
	.string	"ch"
	.byte	0x1
	.byte	0x18
	.long	0x33
	.byte	0x1
	.byte	0x53
	.uleb128 0x14
	.long	.LASF26
	.byte	0x1
	.byte	0x1a
	.long	0x18f
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0x0
	.uleb128 0x12
	.long	0x300
	.byte	0x1
	.long	.LASF25
	.byte	0x1
	.byte	0x28
	.byte	0x1
	.long	0x33
	.long	.LFB10
	.long	.LFE10
	.byte	0x1
	.byte	0x54
	.uleb128 0x13
	.string	"s"
	.byte	0x1
	.byte	0x27
	.long	0x300
	.byte	0x1
	.byte	0x53
	.uleb128 0x14
	.long	.LASF27
	.byte	0x1
	.byte	0x29
	.long	0x33
	.byte	0x1
	.byte	0x56
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x306
	.uleb128 0x10
	.long	0x201
	.uleb128 0x15
	.long	0x351
	.long	.LASF28
	.byte	0x1
	.byte	0x45
	.byte	0x1
	.long	0x33
	.long	.LFB12
	.long	.LFE12
	.byte	0x1
	.byte	0x54
	.uleb128 0x13
	.string	"s"
	.byte	0x1
	.byte	0x44
	.long	0x351
	.byte	0x1
	.byte	0x56
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x46
	.long	0x33
	.byte	0x1
	.byte	0x53
	.uleb128 0x17
	.long	0x357
	.long	.LBB2
	.long	.LBE2
	.uleb128 0x18
	.long	0x368
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x300
	.uleb128 0x19
	.long	0x373
	.long	.LASF29
	.byte	0x1
	.byte	0x40
	.byte	0x1
	.long	0x33
	.byte	0x3
	.uleb128 0x1a
	.string	"ch"
	.byte	0x1
	.byte	0x3f
	.long	0x33
	.byte	0x0
	.uleb128 0x12
	.long	0x3ba
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.byte	0x4e
	.byte	0x1
	.long	0x70
	.long	.LFB13
	.long	.LFE13
	.byte	0x1
	.byte	0x54
	.uleb128 0x13
	.string	"s"
	.byte	0x1
	.byte	0x4d
	.long	0x300
	.byte	0x1
	.byte	0x51
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x4f
	.long	0x70
	.byte	0x1
	.byte	0x53
	.uleb128 0x17
	.long	0x357
	.long	.LBB8
	.long	.LBE8
	.uleb128 0x18
	.long	0x368
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.long	0x47a
	.long	.LASF31
	.byte	0x1
	.byte	0x6f
	.byte	0x1
	.long	0x1fb
	.long	.LFB15
	.long	.LFE15
	.byte	0x1
	.byte	0x54
	.uleb128 0x13
	.string	"str"
	.byte	0x1
	.byte	0x6d
	.long	0x1fb
	.byte	0x1
	.byte	0x56
	.uleb128 0x13
	.string	"num"
	.byte	0x1
	.byte	0x6d
	.long	0x47a
	.byte	0x1
	.byte	0x57
	.uleb128 0x1b
	.long	.LASF32
	.byte	0x1
	.byte	0x6d
	.long	0x33
	.byte	0x3
	.byte	0x91
	.sleb128 128
	.uleb128 0x1b
	.long	.LASF33
	.byte	0x1
	.byte	0x6d
	.long	0x33
	.byte	0x1
	.byte	0x53
	.uleb128 0x1b
	.long	.LASF34
	.byte	0x1
	.byte	0x6e
	.long	0x33
	.byte	0x3
	.byte	0x91
	.sleb128 136
	.uleb128 0x1b
	.long	.LASF35
	.byte	0x1
	.byte	0x6e
	.long	0x33
	.byte	0x1
	.byte	0x55
	.uleb128 0x16
	.string	"c"
	.byte	0x1
	.byte	0x70
	.long	0x201
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x14
	.long	.LASF36
	.byte	0x1
	.byte	0x70
	.long	0x201
	.byte	0x2
	.byte	0x91
	.sleb128 11
	.uleb128 0x16
	.string	"tmp"
	.byte	0x1
	.byte	0x70
	.long	0x481
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x14
	.long	.LASF37
	.byte	0x1
	.byte	0x71
	.long	0x300
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x72
	.long	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x0
	.uleb128 0x1d
	.long	.LASF38
	.byte	0x1
	.byte	0x93
	.long	0x33
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.long	.LASF39
	.byte	0x4
	.byte	0x5
	.uleb128 0x7
	.long	0x491
	.long	0x201
	.uleb128 0x8
	.long	0xb2
	.byte	0x41
	.byte	0x0
	.uleb128 0x12
	.long	0x5d7
	.byte	0x1
	.long	.LASF40
	.byte	0x1
	.byte	0xb4
	.byte	0x1
	.long	0x33
	.long	.LFB16
	.long	.LFE16
	.byte	0x1
	.byte	0x54
	.uleb128 0x13
	.string	"buf"
	.byte	0x1
	.byte	0xb3
	.long	0x1fb
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x13
	.string	"fmt"
	.byte	0x1
	.byte	0xb3
	.long	0x300
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x1b
	.long	.LASF41
	.byte	0x1
	.byte	0xb3
	.long	0x28b
	.byte	0x1
	.byte	0x56
	.uleb128 0x1e
	.string	"len"
	.byte	0x1
	.byte	0xb5
	.long	0x33
	.uleb128 0x16
	.string	"num"
	.byte	0x1
	.byte	0xb6
	.long	0x5d7
	.byte	0x1
	.byte	0x52
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0xb7
	.long	0x33
	.byte	0x1
	.byte	0x52
	.uleb128 0x14
	.long	.LASF32
	.byte	0x1
	.byte	0xb7
	.long	0x33
	.byte	0x1
	.byte	0x55
	.uleb128 0x16
	.string	"str"
	.byte	0x1
	.byte	0xb8
	.long	0x1fb
	.byte	0x1
	.byte	0x53
	.uleb128 0x16
	.string	"s"
	.byte	0x1
	.byte	0xb9
	.long	0x300
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	.LASF42
	.byte	0x1
	.byte	0xbb
	.long	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.long	.LASF43
	.byte	0x1
	.byte	0xbd
	.long	0x33
	.byte	0x1
	.byte	0x57
	.uleb128 0x14
	.long	.LASF34
	.byte	0x1
	.byte	0xbe
	.long	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.long	.LASF44
	.byte	0x1
	.byte	0xc0
	.long	0x33
	.byte	0x1
	.byte	0x51
	.uleb128 0x1f
	.long	.LASF58
	.byte	0x1
	.byte	0xcd
	.long	.L89
	.uleb128 0x20
	.long	0x577
	.long	0x357
	.long	.LBB12
	.long	.LBE12
	.uleb128 0x18
	.long	0x368
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x20
	.long	0x590
	.long	0x357
	.long	.LBB14
	.long	.LBE14
	.uleb128 0x18
	.long	0x368
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x20
	.long	0x5bf
	.long	0x5de
	.long	.LBB16
	.long	.LBE16
	.uleb128 0x21
	.long	0x5ef
	.uleb128 0x18
	.long	0x5f8
	.byte	0x1
	.byte	0x52
	.uleb128 0x22
	.long	.LBB17
	.long	.LBE17
	.uleb128 0x23
	.long	0x603
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.long	.LBB18
	.long	.LBE18
	.uleb128 0x24
	.string	"ip"
	.byte	0x1
	.value	0x122
	.long	0x60e
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.long	.LASF45
	.byte	0x4
	.byte	0x7
	.uleb128 0x19
	.long	0x60e
	.long	.LASF46
	.byte	0x1
	.byte	0x56
	.byte	0x1
	.long	0x33
	.byte	0x1
	.uleb128 0x1a
	.string	"s"
	.byte	0x1
	.byte	0x55
	.long	0x300
	.uleb128 0x25
	.long	.LASF47
	.byte	0x1
	.byte	0x55
	.long	0x33
	.uleb128 0x1e
	.string	"es"
	.byte	0x1
	.byte	0x57
	.long	0x300
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.long	0x33
	.uleb128 0x26
	.long	0x668
	.byte	0x1
	.long	.LASF48
	.byte	0x1
	.value	0x155
	.byte	0x1
	.long	0x33
	.long	.LFB17
	.long	.LFE17
	.byte	0x1
	.byte	0x54
	.uleb128 0x27
	.string	"buf"
	.byte	0x1
	.value	0x154
	.long	0x1fb
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x27
	.string	"fmt"
	.byte	0x1
	.value	0x154
	.long	0x300
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x28
	.uleb128 0x29
	.long	.LASF41
	.byte	0x1
	.value	0x156
	.long	0x28b
	.uleb128 0x24
	.string	"i"
	.byte	0x1
	.value	0x157
	.long	0x33
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x26
	.long	0x6bf
	.byte	0x1
	.long	.LASF49
	.byte	0x1
	.value	0x160
	.byte	0x1
	.long	0x33
	.long	.LFB18
	.long	.LFE18
	.byte	0x1
	.byte	0x54
	.uleb128 0x27
	.string	"fmt"
	.byte	0x1
	.value	0x15f
	.long	0x300
	.byte	0x3
	.byte	0x91
	.sleb128 1036
	.uleb128 0x28
	.uleb128 0x2a
	.long	.LASF50
	.byte	0x1
	.value	0x161
	.long	0x6bf
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x29
	.long	.LASF41
	.byte	0x1
	.value	0x162
	.long	0x28b
	.uleb128 0x2a
	.long	.LASF51
	.byte	0x1
	.value	0x163
	.long	0x33
	.byte	0x1
	.byte	0x56
	.byte	0x0
	.uleb128 0x7
	.long	0x6d0
	.long	0x201
	.uleb128 0x2b
	.long	0xb2
	.value	0x3ff
	.byte	0x0
	.uleb128 0x2c
	.long	.LASF52
	.byte	0x2
	.byte	0x4d
	.long	0x19a
	.byte	0x1
	.byte	0x1
	.uleb128 0x2c
	.long	.LASF53
	.byte	0x5
	.byte	0x1e
	.long	0x253
	.byte	0x1
	.byte	0x1
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
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
	.uleb128 0x1f
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
	.uleb128 0x18
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
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
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x50
	.value	0x2
	.long	.Ldebug_info0
	.long	0x6eb
	.long	0x296
	.string	"putchar"
	.long	0x2cc
	.string	"puts"
	.long	0x373
	.string	"atou"
	.long	0x491
	.string	"vsprintf"
	.long	0x614
	.string	"sprintf"
	.long	0x668
	.string	"printf"
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
	.long	.LBB10-.Ltext0
	.long	.LBE10-.Ltext0
	.long	.LBB11-.Ltext0
	.long	.LBE11-.Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF46:
	.string	"strnlen"
.LASF29:
	.string	"isdigit"
.LASF43:
	.string	"field_width"
.LASF52:
	.string	"__com32"
.LASF1:
	.string	"short int"
.LASF12:
	.string	"eflags"
.LASF19:
	.string	"cs_farcall"
.LASF24:
	.string	"putchar"
.LASF58:
	.string	"repeat"
.LASF18:
	.string	"cs_bounce_size"
.LASF57:
	.string	"com32_sys_args"
.LASF38:
	.string	"__res"
.LASF23:
	.string	"va_list"
.LASF4:
	.string	"uint8_t"
.LASF7:
	.string	"uint32_t"
.LASF55:
	.string	"conio.c"
.LASF2:
	.string	"long long int"
.LASF39:
	.string	"long int"
.LASF49:
	.string	"printf"
.LASF50:
	.string	"printf_buf"
.LASF37:
	.string	"digits"
.LASF48:
	.string	"sprintf"
.LASF13:
	.string	"com32sys_t"
.LASF30:
	.string	"atou"
.LASF3:
	.string	"unsigned char"
.LASF56:
	.string	"/home/lfs-kable/bootcd/extra/syslinux-3.09/memdisk"
.LASF0:
	.string	"signed char"
.LASF42:
	.string	"flags"
.LASF9:
	.string	"long long unsigned int"
.LASF35:
	.string	"type"
.LASF10:
	.string	"reg32_t"
.LASF8:
	.string	"unsigned int"
.LASF54:
	.string	"GNU C 3.4.1"
.LASF14:
	.string	"cs_sysargs"
.LASF41:
	.string	"args"
.LASF25:
	.string	"puts"
.LASF47:
	.string	"maxlen"
.LASF53:
	.string	"syscall"
.LASF6:
	.string	"short unsigned int"
.LASF20:
	.string	"char"
.LASF5:
	.string	"uint16_t"
.LASF40:
	.string	"vsprintf"
.LASF11:
	.string	"_unused"
.LASF45:
	.string	"long unsigned int"
.LASF36:
	.string	"sign"
.LASF51:
	.string	"printed"
.LASF44:
	.string	"qualifier"
.LASF33:
	.string	"size"
.LASF28:
	.string	"skip_atoi"
.LASF27:
	.string	"count"
.LASF16:
	.string	"cs_intcall"
.LASF22:
	.string	"__gnuc_va_list"
.LASF21:
	.string	"syscall_t"
.LASF15:
	.string	"cs_cmdline"
.LASF17:
	.string	"cs_bounce"
.LASF31:
	.string	"number"
.LASF32:
	.string	"base"
.LASF34:
	.string	"precision"
.LASF26:
	.string	"regs"
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.4.1"
