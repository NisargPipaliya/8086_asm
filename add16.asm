code SEGMENT
ASSUME cs:code
start: MOV AX,1234H
	   MOV BX,4321H
	   ADD AX,BX
	   MOV AX,4C00H
	   INT 21H
   code ENDS
   END start