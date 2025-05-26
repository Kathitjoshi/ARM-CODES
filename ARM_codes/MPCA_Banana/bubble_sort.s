.section .data
array: .word 5, 2, 9, 1, 6, 3
size: .word 6

.section .text
.global _start

_start:
    LDR r1, =size
    LDR r2, [r1]
    LDR r3, =array
    SUB r2, r2, #1
outer_loop:
    MOV r4, r2
    CMP r4, #0
    BLE end
    MOV r5, #0
inner_loop:
    LDR r6, [r3, r5, LSL #2]
    ADD r7, r5, #1
    LDR r8, [r3, r7, LSL #2]
    CMP r6, r8
    BLE no_swap
    STR r8, [r3, r5, LSL #2]
    STR r6, [r3, r7, LSL #2]
no_swap:
    ADD r5, r5, #1
    CMP r5, r4
    BLT inner_loop
    SUB r2, r2, #1
    B outer_loop
end:
    MOV r7, #1
    SWI 0
