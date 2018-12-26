; Write an assembly program to define 3 integers of 2 bytes each.
; Name these a, b and c.
; Compute and save into 4 memory locations:
; a+b, a-b, a+c, a-c.

	segment	.data
a	dw	2
b	dw	4
c	dw	-6

	segment .bss
sum1	resw	1
sum2	resw	1
sum3	resw	1
sum4	resw	1

	segment .text
	global _start
_start:
	movsx	rax, word [a]	; get a from memory
	movsx	rbx, word [b]	; get b from memory
	movsx	rcx, word [c]	; get c from memory

	push	rax		; store rax for reusing 4 times
	push	rax
	push 	rax
	push 	rax
	

_sum1:
	pop	rax		; get a
	add	rax, rbx	; a + b //rax <- rax + rbx
	mov	[sum1], rax	; store the sum // [sum1] <- rax

_sum2:
	pop	rax
	sub	rax, rbx	; a - b //rax <- rax - rbx
	mov	[sum2], rax	; store the sum

_sum3: 	
	pop	rax
	add	rax, rcx	; a+c
	mov	[sum3], rax	; store the sum

_sum4:
	pop	rax
	sub	rax, rcx	; a-c
	mov	[sum4], rax	; store the sum

_exit:
	mov	rax, 1
	xor	rbx, rbx
	int	0x80

