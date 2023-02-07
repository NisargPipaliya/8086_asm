data_here segment
	n DB 05
	arr DB 12h,56h,02h,21h,45h
	result DB 5 dup(0)
data_here ends

code_here segment
	Assume cs:code_here,ds:data_here
	
start: mov ax,data_here
		mov ds,ax
		mov bl,n
		mov cx,05h
		mov SI,offset arr
		mov DI,offset result 
		
next:	mov al,byte[bx]
		mul bl
		mov byte ptr[di],al
		INC si
		INC di
		loop next
		
		mov ax,4c00h
		INT 21H
		
code_here ends
end start