.data
A:.word 1,2,3,4,5,6,7,8,9,10,11,12
SUM:.word 0

.text
MOV R0,#1 
MOV R1,#4 
MOV R2,#0 
MOV R3,#4 
MOV R4,#0 
LDR R5,=SUM

LOOP:
LDR R6,=A
MLA R7,R0,R1,R2 
MLA R6,R7,R3,R6 
LDR R8,[R6]
ADD R4,R4,R8
ADD R2,R2,#1 
CMP R2,R1 
BNE LOOP
STR R4,[R5]

.end
