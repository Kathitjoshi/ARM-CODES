.data
A:.word 0,0,0,0,0,0,0

.text
LDR R1,=A 
MOV R2,#7 
MOV R4,#0 
MOV R5,#1
LOOP:LDR R3,[R1] 
STR R4,[R1],#4
STR R5,[R1],#4 
ADD R4,R4,R5 
ADD R5,R4,R5 
SUB R2,R2,#2 
CMP R2,#1 
BEQ LOOP2 
CMP R2,#0 
BNE LOOP
B EXIT
 LOOP2:
STR R4,[R1] 
EXIT:SWI 0x11
.end
