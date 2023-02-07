code segment
	assume cs:code
start:	mov ax,009H
		mov ax,4c00h
		INT 21h
code ends
	end start