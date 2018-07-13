.MODEL SMALL
.STACK 100h
.386
.DATA
src DB " 12aAEZZNN$"
space BYTE "0$"
num BYTE "0$"
cons BYTE "0$" 
vow BYTE "0$" 
s1 DB "NUMBER of SPACE(S) IS:$"
n1 DB "NUMBER of DIGIT(S) IS:$"
v1 DB "NUMBER of VOWEL(S) IS:$"
c1 DB "NUMBER of CONSONENT(S) IS:$"
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX

MOV CX,lengthof src

MOV SI,0


@scan:
MOV bl,src[SI]

CMP bl,32
JE @space

cmp bl,0
JE @or1

CMP bl,65
JE @vowel


CMP bl,69
JE @vowel


CMP bl,73
JE @vowel


CMP bl,79
JE @vowel


CMP bl,85
JE @vowel


CMP bl,97
JE @vowel

CMP bl,101
JE @vowel


CMP bl,105
JE @vowel


CMP bl,111
JE @vowel


CMP bl,117
JE @vowel



CMP bl,66
JGE @orb


cmp bl,"$"
JE @exit


LOOP @scan

@or1:
CMP bl,9
JLE @digit

@digit:
INC num
JMP @increment

@vowel:
INC vow
JMP @increment 

@space:

INC space
JMP @increment

@cons:
INC cons
JMP @increment

@increment:
INC SI
JMP @scan
 

@orb:
CMP bl,90
JLE @cons
jmp @orc
@orc:
CMP bl,98
JGE @ord
@ord:
CMP bl,122
JLE @cons

@exit:

MOV AH,9
MOV dx,offset s1
INT 21h

MOV AH,9
MOV dx,offset space
INT 21h

MOV AH,2
MOV DL,10
INT 21h

MOV AH,2
MOV DL,13
INT 21h

MOV AH,9
MOV dx,offset n1
INT 21h

MOV AH,9
MOV dx,offset num
INT 21h

MOV AH,2
MOV DL,10
INT 21h

MOV AH,2
MOV DL,13
INT 21h

MOV AH,9
MOV dx,offset v1
INT 21h

MOV AH,9
MOV dx,offset vow
INT 21h

MOV AH,2
MOV DL,10
INT 21h

MOV AH,2
MOV DL,13
INT 21h

MOV AH,9
MOV dx,offset c1
INT 21h

MOV AH,9
MOV dx,offset cons
INT 21h
MOV AH,4CH
INT 21h
MAIN ENDP
END MAIN