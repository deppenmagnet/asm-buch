segment .text
    global  _start
_start:
        mov rax,0x123456789abcdef0
        mov eax,100
        mov rax, 10
        mov rax, 0 
        
_exit:
	mov rax,1
	mov rbx,0
	int 0x80
