ORG 0x7c00
BITS 16

start: 
    jmp $

print:

print_char:
    mov ah, 0eh
    int 0x10
    ret

message: db 'Hello World!', 0

times 25 - ($-$$) db 0
dw 0xAA55