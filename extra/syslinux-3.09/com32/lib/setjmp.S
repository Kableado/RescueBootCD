#
# arch/i386/setjmp.S
#
# setjmp/longjmp for the i386 architecture
#

#
# The jmp_buf is assumed to contain the following, in order:
#	%ebx
#	%esp
#	%ebp
#	%esi
#	%edi
#	<return address>
#

	.text
	.align 4
	.globl setjmp
	.type setjmp, @function
setjmp:
#ifdef REGPARM
	movl %eax,%edx
#else
	movl 4(%esp),%edx
#endif	
	popl %ecx			# Return address, and adjust the stack
	xorl %eax,%eax			# Return value
	movl %ebx,(%edx)
	movl %esp,4(%edx)		# Post-return %esp!
	pushl %ecx			# Make the call/return stack happy
	movl %ebp,8(%edx)
	movl %esi,12(%edx)
	movl %edi,16(%edx)
	movl %ecx,20(%edx)		# Return address
	ret

	.size setjmp,.-setjmp

	.text
	.align 4
	.globl longjmp
	.type longjmp, @function
longjmp:
#ifdef REGPARM
	xchgl %eax,%edx
#else
	movl 4(%esp),%edx		# jmp_ptr address
	movl 8(%esp),%eax		# Return value
#endif
	movl (%edx),%ebx
	movl 4(%edx),%esp
	movl 8(%edx),%ebp
	movl 12(%edx),%esi
	movl 16(%edx),%edi
	jmp *20(%edx)

	.size longjmp,.-longjmp
