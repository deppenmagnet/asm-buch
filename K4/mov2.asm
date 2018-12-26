	segment	.data
a	dq	175
b	dq	4097
c	dd	175
d	dd	4097

	segment .bss
res	resq	1

	segment	.text
	global	_start

_start:
	mov	rax, a		;mov address of a into rax
	mov	rax, [a]	;mov a (175) int rax
	add 	rax, [b]	;add b to rax
	xor	rax, rax	;rax = 0

_double:
	mov	rax, c		; mov address of c into rax
	mov	eax, [c]	; mov c (175) into rax
	add	eax, [d]	; add d to rax
	mov	[res], rax	; store rax to res
	xor	rax, rax	; rax = 0;

_quit:
	mov	eax, 1		; exit
	xor 	ebx, ebx	; 0 = exit code
	int	0x80		; call kernel
