data_here segment
	ANS DB ?
data_here ends

code_here segment
	assume cs:code_here,ds:data_here
start:	mov ax,data_here
		mov ds,ax
		MOV ah,01h
		int 21h
		
code_here ends
end start
		
		
		