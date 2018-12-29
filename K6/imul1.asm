;mul is for unsigned ints
;imul for signed ints

	segment	.text
	global _start
_start:
	push rbp
	mov rbp, rsp
	mov rax, 0x7fffffffffffffff
	mov rbx, 256
	imul rbx
	leave

_exit:
	mov rax, 1
	mov rbx, 0
	int	0x80

