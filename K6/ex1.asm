;Exercise 1
;Write an assembly language program to compute the distance squared between 2 points in the plane 
;identified as 2 integer coordinates each, stored in memory.
;
;Thoughts:
; 3 - |    x
; 2 - |
; 1 - |          x
; 0 - +-------------------
;       |  |  |  |  |  |
;       1  2  3  4  5  6
;
; The Pythagorean Theorem could help:
; a = x-value(point1) - x-value(point2)
; b = y-value(point1) - y-value(point2)
; c^2 = a^2 + b^2
; c^2 is to be calculated according to the Ex
;
; If defined point1(2,3) and point2(4,1) then 
; a is 2-4 = -2
; a^2 is 4
; b is 3-1 = 2
; b^2 is also 4
; c^2 equals to 8 ...
;
; Well then ... lets see

	section	.data
p1x	dq	2
p1y	dq	3
p2x	dq	4
p2y	dq	1

	section	.bss
asquare	resq	1
bsquare	resq	1
csquare	resq	1

	section .text
	global	_start			; tell the linker about this symbol
_start:					; Program entry point

_get_a:					; calculate a as x-value(point1) - x-value(point2)
	mov	rax, [p1x]		; load x-value(point1)
	mov	rbx, [p2x]		; load x-value(point2)
	sub	rax, rbx		; rax <- rax - rbx (p1x - p2x)

_a_square:
	imul	rax, rax		; rdx:rax will hold the result. rdx should be not of interest here
	mov	[asquare], rax		; so only save rax

_get_b:					; calculate b as y-value(point1) - y-value(point2)
	mov	rax, [p1y]		; load y-value (point1)
	sub	rax, [p2y]		; trying this time to subtract from memory // rax <- rax - p2y

_b_square:
	imul	rax, rax		; rdx:rax will hold the result. rdx should be not of interest here
	mov	[bsquare], rax		; so only save rax


_c_square:				; calulate c^2
	add	rax, [asquare]		; rax = b^2 ... so add simply a^2 to it
	mov	[csquare], rax		; save rax

_exit:
	mov	rax, 1
	xor	rbx, rbx
	int	0x80
