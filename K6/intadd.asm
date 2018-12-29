	segment .data
a	dq	151
b	dq	310

	segment	.bss
sum	resq	1

	segment .text
	global _start
_start:
	push	rbp		;establish a stackframe
	mov	rbp, rsp
	sub	rsp, 16		;make space for 16 byte on the stack for local variables
	mov	rax, 9		;set rax to 9
	add	[a], rax	;add rax to a
	mov	rax, [b]	;set rax to b
	add	rax, 10		;add 10 to rax
	add	rax, [a]	;add a 
	mov	[sum], rax	;save rax to sum
	xor	rax, rax	;set rax to 0
	leave			;restore previous stackframe

_exit:
	mov	rax, 1
	xor	rbx, rbx
	int	0x80
