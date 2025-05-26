.data
A: .word 1, 2, 3, 4, 5, 6
POS: .word 0, 0, 0, 0, 0, 0
SMALLEST: .word 0

.text

LDR R0, =A
LDR R1, =POS
LDR R2, =SMALLEST

MOV R4, #6
MOV R5, #0

LDR R6, [R0], #4  
STR R6, [R1], #4   
ADD R5, R5, #1     
LOOP1:
    LDR R8, [R0], #4
    STR R8, [R1], #4
    ADD R5, R5, #1

    CMP R8, R6
    BLT UPDATE_SMALLEST

    B LOOP3

UPDATE_SMALLEST:
    MOV R6, R8

LOOP3:
    SUB R4, R4, #1
    CMP R4, #0
    BNE LOOP1

    STR R6, [R2]

.end