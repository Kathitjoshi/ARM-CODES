.data
str:.asciz "Kathit Joshi PES2UG23CS264" 
num:.word 15000

.text
MOV R0,#30 
MOV R1,#7 
MOV R7,#0 
LDR R8,=num 
BL Sum
LDR R8,[R8] 
LDR R2,=str
LOOP:SWI 0x204
BL Sum 
CMP R0,#0
SUBNE R0,R0,#1 
SWIEQ 0x11
B LOOP

Sum:CMP R7,R8 
ADDNE R7,R7,#1
BNE Sum 
SWI 0x206 
MOV R7,#0 
MOV PC,LR

.end
