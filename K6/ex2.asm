;Exercise 2
; If we could do floating point division, this exercise would have you compute the slope of the line segment connection 2 points.
; Instead you are to store the difference in xcoordinates in 1 memory location and the difference in y coordinates in another. The input points are integers
; stored in memory. Leave register rax with the value 1 if the line segment is vertical (infinite or undefined slope) and 0 if it is not.
; You should use conditional move to set the value of rax.
;
;Thoughts:
; 3 - |    x1
; 2 - |
; 1 - |    x3     x2
; 0 - +-------------------
;       |  |  |  |  |  |
;       1  2  3  4  5  6
;
;We have three points. Should be easy to calculate the difference in the coordinates. 
;Here we have to test the combination p1p3 and p2p3
;
; Well then ... lets see

	section	.data
p1x	dq	2
p1y	dq	3
p2x	dq	4
p2y	dq	1
p3x	dq	2
p3y	dq	1
one	dq	1
zero	dq	0

	section	.bss
diffx	resq	1
diffy	resq	1

	section .text
	global	_start			; tell the linker about this symbol
_start:					; Program entry point

_p1_p3_x:				; calculate a as x-value(point1) - x-value(point3)
	mov	rax, [p1x]		; load x-value(point1)
	sub	rax, [p3x]		; rax <- rax - rbx (p1x - p2x)
	cmovz	rax, [one]			; if the line segment is vertical and we have to save '1'
	mov	[diffx], rax		; save rax
_p1_p3_y:
	mov	rax, [p1y]		; load p1y
	sub	rax, [p3y]		; calculate the difference in y coordinates
	cmovz	rax, [zero]			; if horizontal: save 0
	mov	[diffy], rax		; save rax

_p1_p2_x:
	mov	rax, [p1x]		; load x-value(point1)
	sub	rax, [p2x]		; rax <- rax - rbx (p1x - p2x)
	cmovz	rax, [one]			; if the line segment is vertical and we have to save '1'
	mov	[diffx], rax		; save rax
_p1_p2_y:
	mov	rax, [p1y]		; load p1y
	sub	rax, [p2y]		; calculate the difference in y coordinates
	cmovz	rax, [zero]			; if horizontal: save 0
	mov	[diffy], rax		; save rax

_p3_p2_x:
	mov	rax, [p3x]		; load x-value(point1)
	sub	rax, [p2x]		; rax <- rax - rbx (p1x - p2x)
	cmovz	rax, [one]			; if the line segment is vertical and we have to save '1'
	mov	[diffx], rax		; save rax
_p3_p2_y:
	mov	rax, [p3y]		; load p1y
	sub	rax, [p2y]		; calculate the difference in y coordinates
	cmovz	rax, [zero]			; if horizontal: save 0
	mov	[diffy], rax		; save rax

_exit:
	mov	rax, [one]
	xor	rbx, rbx
	int	0x80
