ORG 0x7c00
BITS 16

start: 
    mov si, message
    call print
    jmp $

print:
    mov bx, 0
    lodsb
    ret

print_char:
    mov ah, 0eh
    int 0x10
    ret

message: db 'Hello World!', 0

;times 50 - ($-$$) db 0
dw 0xAA55