data_here segment
	Str DB "HELLO$"
data_here ends

code_here segment

	assume cs:code_here,ds:data_here
	
start:	mov ax,data_here
		mov ds,ax
		mov dx,offset Str
		mov ah,09h
		int 21h
code_here ends
end start