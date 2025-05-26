.DATA
TEXT: .ASCIZ "Kathit Joshi"
SIZE: .WORD 0

.TEXT
    LDR R0, =TEXT
    SWI 0x02
    MOV R1, #0

CHECK_LEN:
    LDRB R2, [R0], #1
    CMP R2, #0
    BEQ SAVE_LEN
    ADD R1, R1, #1
    B CHECK_LEN

SAVE_LEN:
    LDR R3, =SIZE
    STR R1, [R3]
    SWI 0x11

.END