data_here segment
	block DB 12h,56h,02h,21h,45h
	result DW ?
data_here ends

code_here segment
	Assume cs:code_here,ds:data_here
	
start: mov ax,data_here
		mov ds,ax
		
		mov cx,05h
		mov ax,0h
		mov bx,offset block
		
next:	add ax,word ptr[bx]
		loop next
		inc bx
		
		mov result,ax
		int 3
code_here ends
end start