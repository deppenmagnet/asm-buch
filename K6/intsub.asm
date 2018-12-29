	segment .data
a	dq	100
b	dq	200

	segment .bss
diff	resq	1

	segment .text
	global _start
_start:
	push	rbp			;establish a stack frame
	mov	rbp, rsp		;basepointer <- stackpointer
	sub	rsp, 16			;16 bytes for local vars

	mov	rax, 10			;rax <- 10
	sub	[a], rax		;a <- a - rax
	sub	[b], rax		;b <- b - rax
	mov	rax, [b]		;rax <- b
	sub	rax, [a]		;rax <- rax - a
	mov	[diff], rax		;diff <- rax
	xor	rax, rax		;rax <- 0
	leave				;rewind stackmanipulations
_exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80
