;   Program:    exit
;   Executes the exit system call
;
;   Input:      No input
;
;   Output:     Only the exit system status
;           $? in the shell

segment .text
    global  _start

_start:
    mov eax,1       ;Syscall for exit
    mov ebx,0       ;the status value to return
    int 0x80        ;execute the system call
