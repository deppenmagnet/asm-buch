	segment	.data
x	dq	325		; dividend
y	dq	16		; divisor

	segment .bss
quot	resq 	1		; quotient
rem	resq	1		; remainder

	segment .text
	global _start
_start:
	mov	rax, [x]	;mov a into rax
	xor	rdx, rdx	;rdx are the high bytes of dividend which are in this case 0
	idiv	qword [y]	;divide x by y (rdx:rax / y)
	mov	[quot], rax	;save the quotient
	mov	[rem], rdx	;save the remainder

_exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80
