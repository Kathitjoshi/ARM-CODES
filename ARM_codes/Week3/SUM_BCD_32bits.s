.data
A:.word 0x12345678

.text
LDR R0,=A 
MOV R1,#8 
MOV R2,#0 
LDR R3,[R0]

LOOP:AND R4,R3,#0xF 
ADD R2,R2,R4 
MOV R3,R3,LSR #4 
SUB R1,R1,#1
CMP R1,#0 
BNE LOOP 
B EXIT

EXIT:SWI 0x11

.end
