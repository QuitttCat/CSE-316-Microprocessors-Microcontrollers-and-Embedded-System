.MODEL SMALL
.STACK 100H
.DATA

;MSG DB 'GCD IS : $'  
NEWLINE DB 13, 10, '$'  
SPACES DB '  $'
LEN DB ?
ARR DB 0,0,0,0,0,0,0,0,0,0 
SRC DB ?


.CODE 


MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,1
    INT 21H 
    AND AL,0FH
    MOV LEN,AL 
    MOV AH,0 
    
    
    MOV CX,AX
    
    MOV AH,09H
    LEA DX,NEWLINE
    INT 21H
    
    WHILE:
    MOV AH,1
    INT 21H
    AND AL,0FH
    ;MOV DL,AL
    
    ;MOV AH,2
    ;INT 21H 
    
    LEA SI, ARR
    
    LP: 
    CMP AL,0
    JE ASSIGN
    ADD SI,1
    SUB AL,1
    JMP LP
    
    
    ASSIGN:
    MOV DL,ARR[SI]
    INC DL
    MOV ARR[SI], DL 
    
     
    
    MOV AH,9
    LEA DX,SPACES
    INT 21H
    LOOP WHILE 
    
    MOV AH,09H
    LEA DX,NEWLINE
    INT 21H
    
    MOV AH,1
    INT 21H 
    AND AL,0FH
    MOV SRC,AL 
    
    MOV AH,09H
    LEA DX,NEWLINE
    INT 21H
    
    
    LEA SI, ARR
    
    LP2: 
    CMP SRC,0
    JE ASSIGN2
    ADD SI,1
    SUB SRC,1
    JMP LP2
    
    ASSIGN2:
    MOV DL,ARR[SI]
    
    MOV AH,2
    ADD DL,'0'
    INT 21H
    
    
   
    
    MOV AH,4CH
    INT 21H
    
    
    
    
MAIN ENDP

END MAIN
    
    