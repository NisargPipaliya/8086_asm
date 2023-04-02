DATA SEGMENT
	dividend dw 5678h,1234h
	divisor dw 2345h
DATA ENDS

DATA2 segment 
	quotient dw 2 dup(0)
	remainder dw 0
DATA2 ENDS

STACK_HERE SEGMENT 
	DW 40 DUP(0)
	t_o_s LABEL WORD
STACK_HERE ENDS

PUBLIC divisor

PROCEDURE SEGMENT PUBLIC 
		EXTRN SMART_DIVISOR:FAR
PROCEDURE ENDS

CODE SEGMENT WORD PUBLIC
	ASSUME CS:CODE,DS:DATA,SS:STACK_HERE
start:	MOV DS,AX
		MOV AX,STACK_HERE
		MOV SS,AX
		MOV SP,OFFSET t_o_s
		MOV AX,DIVIDEND
		MOV DX,DIVIDEND+2
		MOV CX,DIVISOR
		
		CALL SMART_DIVIDE
		JNC SAVE_ALL
		JMP STOP
		
SAVE_ALL: 
	    PUSH DS
		ASSUME DS:DATA2
		
		MOV BX,DATA2
		MOV DS,BX
		
		MOV QUOTIENT,AX
		MOV QUOTIENT+2,DX
		MOV REMAINDER,CX
		
		ASSUME DS:DATA
		POP DS
STOP: INT 3
CODE ENDS
END START
		
		