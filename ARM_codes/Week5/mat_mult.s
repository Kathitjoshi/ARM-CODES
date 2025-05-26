.data
A:.word 1,2,3,4,5,6,7,8,9
B:.word 1,1,2,2,3,3,4,4,5
C:.word 0,0,0,0,0,0,0,0,0
.text
LDR R0,=A 
LDR R1,=B 
LDR R2,=C 
MOV R10,#3
MOV R11,#4 
MOV R3,#0
OLoop:MOV R4,#0 
MLoop:MOV R8,#0 
MOV R9,#0
ILoop:MLA R5,R3,R10,R8 
MUL R5,R11,R5
LDR R7,[R0,R5] 
MLA R6,R8,R10,R4 
MUL R6,R11,R6 
LDR R12,[R1,R6] 
MLA R9,R7,R12,R9 
ADD R8,R8,#1 
CMP R8,#3
BEQ Reset 
B ILoop

Reset:STR R9,[R2] 
ADD R2,R2,#4 
ADD R4,R4,#1 
CMP R4,#3
BEQ Continue 
B MLoop
Continue:ADD R3,R3,#1 
CMP R3,#3
BEQ Exit 
B OLoop 
Exit:SWI 0x11

.end
