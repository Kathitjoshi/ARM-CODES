.DATA
    INPUT_STR: .ASCIZ "nag"

.TEXT
    LDR     R0, =INPUT_STR
    MOV     R1, R0

LOCATE_END:
    LDRB    R2, [R1], #1
    CMP     R2, #0
    BNE     LOCATE_END

    SUB     R1, R1, #2
    LDRB    R2, [R0]
    LDRB    R3, [R1]
    STRB    R3, [R0]
    STRB    R2, [R1]

    MOV     R0, R0
    SWI     0x02

    SWI     0x11

.END
