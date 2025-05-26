.data
MATRIX:    .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16  
NUM_COLS:  .word 4      
ROW:       .word 2      
COL:       .word 3      
BASE_ADDR: .word MATRIX 

.text
    MOV R10,#4
    LDR R0, =ROW        
    LDR R1, [R0]        

    LDR R2, =COL        
    LDR R3, [R2]        

    LDR R4, =NUM_COLS   
    LDR R5, [R4]        

    MLA R6, R1, R5, R3  

    LDR R7, =BASE_ADDR  
    LDR R8, [R7]        

    MUL R6,R10,R6    
    ADD R9,R8,R6      

.end