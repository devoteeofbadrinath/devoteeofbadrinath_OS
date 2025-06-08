section .text
global _start

_start:
    mov eax, 1      ; sys_exit
    mov ebx, 42     ; status
    int 0x80

section .data
    myString db 'Hello',0