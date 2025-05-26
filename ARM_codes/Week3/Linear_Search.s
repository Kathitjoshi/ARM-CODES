.data
A: .hword 1,2,3,4,5,6
Key: .hword 3

.text

LDR R0,=A
LDR R1,=Key
MOV R4,#0
MOV R5,#6
LOOP: 	LDRH R2,[R0]
	LDRH R3,[R1]
	CMP R2,R3
	BEQ LOOP1

	ADD R0,R0,#2
	SUB R5,R5,#1
	CMP R5,#0
	BNE LOOP
	B EXIT


LOOP1: MOV R4,#1
EXIT:	SWI 0X11