.data
A: .word 1, 2, 3, 4, -1, 5, -2, -3, 6, 0
POS: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
NEG: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
NEG_SUM: .word 0

.text

LDR R0, =A
LDR R1, =POS
LDR R2, =NEG
LDR R3, =NEG_SUM

MOV R4, #10
MOV R5, #0

LOOP1:
    LDR R8, [R0], #4
    CMP R8, #0
    BMI LOOP2

    STR R8, [R1], #4
    B LOOP3

LOOP2:
    STR R8, [R2], #4
    ADD R5, R5, R8

LOOP3:
    SUB R4, R4, #1
    CMP R4, #0
    BNE LOOP1

    STR R5, [R3]

.end