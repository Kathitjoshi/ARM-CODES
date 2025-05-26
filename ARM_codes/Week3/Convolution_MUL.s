.data
A:.word 1,3,5,7,9
B:.word 2,4,6,8,10
.text
LDR R0,=A 
LDR R1,=B 
MOV R2,#5 
MOV R4,#0

LOOP:LDR R5,[R0],#4
 LDR R6,[R1],#4 
MUL R7,R5,R6 
ADD R4,R4,R7 
SUB R2,R2,#1 
CMP R2,#0
BNE LOOP 
B EXIT

EXIT:SWI 0x11

.end
