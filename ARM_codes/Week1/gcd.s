MOV R0,#60 
MOV R1,#12 
MOV R2,R0 
MOV R3,R1 
LOOP:
	CMP R2,R3 
	BEQ END 
	BGT GT
	BLT LT
	SUB R3,R3,R2 
	B LOOP
 
GT:
	SUB R2,R2,R3 
	B LOOP
LT:
	SUB R3,R3,R2
	B LOOP

END:
END_LOOP:
