.MODEL small     	      
.STACK 100h      	      
.DATA				
.CODE				
 MAIN PROC			
MOV AX,0
	ROWS:
CMP AX,3
JL  COLUMN
JNL @EXIT_ROWS
MOV CX,0
	COLUMN:
CMP AX,3
JL @IF
JNL @EXIT_COLUMN
@IF:
  CMP CX,AX
  JLE star
  JG SPACE
 star:
 	MOV AH,2
	 MOV DL,'*'
	 INT 21h
 SPACE:
	 MOV AH,2
	 MOV DL,' '
	 INT 21h
INC CX
JMP COLUMN 
 @EXIT_COLUMN:
MOV AH,0AH
MOV AH,0DH
INT 21h
INC AX
JMP ROWS
 @EXIT_ROWS:
            MOV AH,4CH
	    INT 21h
 MAIN ENDP
 END MAIN