.data
    expr: .asciz "832+-5+" @ =8
    stack: .word 0, 0, 0, 0, 0, 0
    res: .word 0

    zero_ASCII_value: .word 48
    plus_ASCII_value: .word 43

.text
    LDR R0, =expr
    LDR R1, =stack
    MOV R2, #0

    LDR R7, =zero_ASCII_value  
    LDR R7, [R7]

    LDR R8, =plus_ASCII_value  
    LDR R8, [R8]

expr_loop:
    LDRB R3, [R0]
    CMP R3, #0
    BEQ end

    @ isdigit()
    CMP R3, R7
    BLT isOperator

    SUB R3, R3, R7
    STR R3, [R1, R2, LSL #2]
    ADD R2, R2, #1

    ADD R0, R0, #1
    B expr_loop

isOperator:
    SUB R2, R2, #1
    LDR R4, [R1, R2, LSL #2]

    SUB R2, R2, #1
    LDR R5, [R1, R2, LSL #2]

    CMP R3, R8
    BEQ add_operator
    B sub_operator

add_operator:
    ADD R6, R5, R4
    B store

sub_operator:
    SUB R6, R5, R4
    B store

store:
    STR R6, [R1, R2, LSL #2]
    ADD R2, R2, #1

    ADD R0, R0, #1
    B expr_loop

end:
    SUB R2, R2, #1
    LDR R0, [R1, R2, LSL #2]

    LDR R1, =res
    STR R0, [R1]

.end
