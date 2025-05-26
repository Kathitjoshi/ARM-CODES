.data
zero:.byte 0b11101101
one:.byte 0b01100000
two:.byte 0b11001110
three:.byte 0b11101010
four:.byte 0b01100011
five:.byte 0b10101011
six:.byte 0b10101111
seven:.byte 0b11100000
eight:.byte 0b11101111
nine:.byte 0b11101011
P:.byte 0b11000111
E:.byte 0b10001111
S:.byte 0b10101011
U:.byte 0b01101101

.text
MOV R0,#0
MOV R2,#0
Loop:SWI 0x202
     ADD R0,R0,#1
     CMP R0,#1
     BEQ Loop1
     CMP R0,#2
     BEQ Loop2
     SWI 0x11

Loop1:MOV R5,#14
      LDR R1,=zero
Back1:LDRB R0,[R1]
      SWI 0x200
      BL Delay
      ADD R1,R1,#1
      SUB R5,R5,#1
      CMP R5,#0
      BNE Back1
      B Loop

Loop2:MOV R5,#14
      LDR R1,=U
Back2:LDRB R0,[R1]
      SWI 0x200
      BL Delay
      SUB R1,R1,#1
      SUB R5,R5,#1
      CMP R5,#0
      BNE Back2
      B Loop

Delay:MOV R4,#256000
Back3:SUB R4,R4,#1
      CMP R4,#0
      BGT Back3
      MOV PC,LR

.end