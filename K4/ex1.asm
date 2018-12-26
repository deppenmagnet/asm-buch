	section .data
a	dq	2
b	dq	4
c	dq	-2
d	dq	-4

	section .text
	global	_start
_start:
	mov	rax, [a]	;load a (2) into rax
	mov	rbx, [b]	;load b (4) into rbx
	mov	rcx, [c]	;load c (-2) into rcx
	mov	rdx, [d]	;load d (-4) into rdx
_add:				;add all registers. sum should be left in rax
	add	rax, rbx	; rax <- rax + rbx
	add	rax, rcx	; rax <- rax + rcx
	add	rax, rdx	; rax <- rax + rdx

_exit:
	mov	rax, 1
	xor 	rbx,rbx
	int	0x80
