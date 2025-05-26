.data
mainstr:.asciz "MPCA Class" 
substr:.asciz "Bong" 
sstr:.asciz "Match found."
 fstr:.asciz "No Match found."
.text
LDR R1,=mainstr
 LDR R2,=substr 
Loop:MOV R3,R2 
OLoop:LDRB R4,[R1]
LDRB R5,[R3]
ILoop:CMP R4,R5
BEQ Compare 
ADD R1,R1,#1
 CMP R4,#0
BEQ Failure 
BNE OLoop
Compare:CMP R5,#0 
BEQ Success 
ADD R1,R1,#1 
ADD R3,R3,#1
B OLoop

Success:LDR R0,=sstr 
SWI 0x02
SWI 0X11

Failure:LDR R0,=fstr 
SWI 0x02
SWI 0x11

.end
