mov ax, 0x0000
mov ss, ax       ; SS = 0x0000
mov sp, 0x7C00   ; SP = 0x7C00
mov ax, 0x1234
push ax   ; Decrements SP by 2, then writes AX to [SS:SP]
mov bx, 0x5678
push bx   ; Decrements SP by 2, then writes BX to [SS:SP]