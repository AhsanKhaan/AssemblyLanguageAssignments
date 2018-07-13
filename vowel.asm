.MODEL small     	      
.STACK 100h      	      
.DATA	
str1 DB "Enter the Value:$"
str2 DB "Would you like to continue(Y/N)$"
vowel DB "This is a vowel$"
cons DB "This is a consonent$"
dig  DB "This is digit$"
str3 DB "Wrong INput$"	
.CODE				
 MAIN PROC			
MOV Dx,@DATA
MOV DS,DX

@yes:
MOV AH,9
MOV DX,offset str1
INT 21h

MOV AH,1
INT 21h
MOV dl,al

CMP dl,'A'
JE @if_body
JNE E
E:
CMP dl,'E'
JE @if_body
JNE I
I:
CMP dl,'I'
JE @if_body
JNE O
O:
CMP dl,'O'
JE @if_body
JNE U
U:
CMP dl,'U'
JE @if_body
JNE a
a:
CMP dl,'a'
JE @if_body
JNE @e
@e:
CMP dl,'e'
JE @if_body
JNE @i
@i:
CMP dl,'i'
JE @if_body
JNE @o
@o:
CMP dl,'o'
JE @if_body
JNE @u
@u:
CMP dl,'u'
JE @if_body
JNE @else_if
JMp @exit
@if_body:


MOV Ah,9
MOV DX,offset vowel
INT 21h
JMP @exit

@else_if:
CMP dl,'0'
JGE @9
JMP @else_2
@9:
CMP dl,'9'
JLE @else_if_body
JNE @else1
JMP @else_2     
@else_if_body:
MOV Ah,9
MOV DX,offset dig
INT 21h
JMP @exit
@else1:
CMP dl,'A'
JGE @and1
@and1:
CMP dl,'Z'
JLE @and2
@and2:
CMP dl,'a'
JGE @and3
@and3:
CMP dl,'z'
JLE @else_1body
Jmp @else_2
@else_1body:
MOV ah,9
MOV DX,offset cons
INT 21h
JMP @exit
@else_2:
MOV AH,9
MOV DX,offset str3
INT 21h
JMp @exit 
@exit:
MOV AH,9
MOV DX,offset str2
INT 21h

MOV AH,1
INt 21h
MOV bl,al
CMP bl,'Y'
JE  @yes
JNE @y
JMP @finish
@y:
CMP bl,'y'
JE @yes
JMP @finish
@finish:
            MOV AH,4CH
	    INT 21h
 MAIN ENDP
 END MAIN