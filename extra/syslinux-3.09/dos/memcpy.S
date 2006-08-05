# $Id: memcpy.S,v 1.2 2004/12/17 10:03:47 hpa Exp $
#
# memcpy.S
#
# Simple 16-bit memcpy() implementation
#

	.text
	.code16gcc
	.globl memcpy
	.type memcpy, @function
memcpy:
	cld
	pushw %di
	pushw %si
	movw %ax,%di
	movw %dx,%si
	# The third argument is already in cx
	rep ; movsb
	popw %si
	popw %di
	ret

	.size memcpy,.-memcpy
