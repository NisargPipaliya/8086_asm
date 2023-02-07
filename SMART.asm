DATA SEGMENT PUBLIC 
	EXTRN divisor:WORD
DATA ENDS

PUBLIC SMART_DIVIDE

PROCEDURES SEGMENT PUBLIC
SMART_DIVIDE PROC NEAR
ASSUME CS:PROCEDURES,DS:DATA
CMP divisor,0H
JE ERROR_EXIT
MOV BX,AX
MOV AX,DX
MOV DX,0000H
DIV CX
MOV BP,AX
MOV AX,BX
DIV CX
MOV CX,DX
MOV DX,BP
CLC
JMP EXIT
ERROR_EXIT: STC
EXIT: RET 

SMART_DIVIDE ENDP

PROCEDURES ENDS
END