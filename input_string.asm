data_here segment
	ans DB 255,256 dup(0)
data_here ends

code_here segment
	assume cs:code_here,ds:data_here
start: mov ax,data_here
		mov dx,ax
		mov dx,offset ans
		mov ah,0Ah
		int 21h
		int 21h
		int 3h
code_here ends
end start