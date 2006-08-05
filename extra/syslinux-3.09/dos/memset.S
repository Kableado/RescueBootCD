# $Id: memset.S,v 1.2 2004/12/17 10:03:47 hpa Exp $
#
# memset.S
#
# Minimal 16-bit memset() implementation
#

	.text
	.code16gcc
	.globl memset
	.type memset, @function
memset:
	cld
	pushw %di
	movw %ax,%di
	movb %dl,%al
	# The third argument is already in %cx
	rep ; stosb
	popw %di
	retl

	.size memset,.-memset
