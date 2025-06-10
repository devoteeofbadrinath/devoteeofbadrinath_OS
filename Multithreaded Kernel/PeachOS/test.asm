.MODEL SMALL
.STACK 100H

.DATA
    msg1 db 'Executing in first code segment!', '$'
    msg2 db 'Now in second code segment!', '$'

.CODE
MAIN PROC
    ; First code segment (default @CODE)
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display message from first segment
    MOV AH, 09h
    LEA DX, msg1
    INT 21h
    
    ; Far jump to second code segment
    ; Assume second segment starts at 1000h
    DB 0EAh            ; Far jump opcode
    DW OFFSET SECOND_CODE  ; Offset
    DW 1000h           ; Segment
    
    ; This won't execute because of the far jump
    MOV AH, 4Ch
    INT 21h
MAIN ENDP

; Second code segment at 1000h:0000
ORG 10000h  ; Adjust this based on your memory layout

SECOND_CODE:
    ; Set up segment registers for this segment
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display message from second segment
    MOV AH, 09h
    LEA DX, msg2
    INT 21h
    
    ; Return to first segment
    DB 0EAh
    DW OFFSET MAIN_CONTINUE
    DW SEG @CODE  ; Original code segment
    
MAIN_CONTINUE:
    ; Execution continues here after returning
    MOV AH, 4Ch
    INT 21h
END MAIN