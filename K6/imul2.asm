;Kleines Programm, um den Satz des Pythagoras zu testen :-)
;
	segment	.data
a	dq	246		;Seite a
b	dq	328		;Seite b
c	dq	410		;Hyptothenuse?

	segment	.text
	global _start
_start:
	mov	rax, [a]	; rax <- a
	imul	rax, rax	; rax <- rax * rax (a^2)
	mov	rbx, [b]	; rbx <- b
	imul	rbx, rbx	; rbx <- rbx * rbx (b^2)
	mov	rcx, [c]	; rcx <- c
	imul	rcx, rcx	; rcx <- rcx * rcx (c^2)
	add	rax, rbx	; rax <- a^2 + b^2
	sub	rax, rcx	; rax <- (a^2 + b^2) - c^2 ... should get 0

_exit:
	mov	rax, 1
	mov	rbx, 2
	int	0x80
