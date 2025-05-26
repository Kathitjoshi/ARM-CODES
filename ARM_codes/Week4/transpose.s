.data
  A:.word 1,2,3,4,5,6,7,8,9
  transpose: .word 0,0,0,0,0,0,0,0,0
.text
  LDR R0, =A
  LDR R1, =transpose
  MOV R2, #3
  MOV R3, #0
outerloop:
  CMP R3, R2
  BGE end
  MOV R4, #0

innerloop:
  CMP R4, R2
  BGE next_row
  MUL R5, R3, R2
  ADD R5, R5, R4
  LDR R6, [R0, R5, LSL #2]

  MUL R7, R4, R2
  ADD R7, R7, R3
  STR R6, [R1, R7, LSL #2]
  ADD R4, R4, #1
  B innerloop
next_row:
  ADD R3, R3, #1
  B outerloop
end:
  B end