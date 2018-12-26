	segment	.data
a	db	2
b	dw	4
c	dd	-2
d	dq	-4

	segment	.text
	global	_start
_start:
	mov	rax,[a]
	movsx	rax,byte [a]
	mov	rbx,[b]
	movsx	rbx, word [b]
	mov	rcx, [c]
	movsxd	rcx, dword [c]
	mov	rdx, [d]
;	movsx	rdx, qword [d]

_add:
	add	rax, rbx
	add	rax, rcx
	add	rax, rdx
	
_quit:
	mov	rax, 1
	mov	rbx, 0
	int 	0x80
