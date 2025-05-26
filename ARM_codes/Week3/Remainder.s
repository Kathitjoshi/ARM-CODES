.data
  A: .word 10
  B: .word 3
.text
  LDR R0, =A    
  LDR R0, [R0]  
  LDR R1, =B    
  LDR R1, [R1]  
loop:
  CMP R0, R1    
  BLT end      
  SUB R0, R0, R1 
  B loop        
end:
  SWI 0x11