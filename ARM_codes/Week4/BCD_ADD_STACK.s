.text
MOV R1, #0x54       
STMIA R13!, {R1}    
MOV R4, #0          
BL SUM             
STMDB R13,{R5}   
EXIT: SWI 0x011     

SUM: 
    AND R2, R1, #0x0F  
    MOV R3, R1, LSR #4 
    ADD R5, R3, R2  
    MOV PC, LR