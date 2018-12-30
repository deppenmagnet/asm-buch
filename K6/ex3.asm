	segment	.data
g1	dq	25
g2	dq	88
g3	dq	99
g4	dq	14		; Average = 56; Remainder = 2

	segment	.bss
avg	resq 1
rem	resq 1

	segment .text
	global _start
_start:
	xor	rdx, rdx		;just to be shure its empty
	mov	rax, [g1]
	add	rax, [g2]
	add	rax, [g3]
	add	rax, [g4]

	mov	rbx, 4			;divisor
	idiv	rbx			;divide sum by 4

	mov	[avg], rax
	mov	[rem], rdx

_exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80
