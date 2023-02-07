data segment
	radius db 10h
	area1 db ?
	pi db 03h
data ends

stack1 segment
	dw 40 dup(0)
	top_stack label word
stack1 ends

code segment 
assume cs:code, ds:data, ss:stack1
start:	mov ax,data
	mov ds,ax
	mov ax,stack1
	mov ss,ax
	mov sp,offset top_stack
	
	mov al,radius
	mov ah,00h
		
	push ax
	call area
	pop ax

	mov area1,al

	mov [di],al
	mov ah,02h
	int 21h
	
	mov ax,4c00h
	int 21h
	
area proc near

	pushf
	push bx
	push cx
	push dx	
	push bp
	mov bp,sp
	mov al,[bp+12]
	mul pi
	mov area1,al
	mul bx
	mov [bp+12],al	
	pop dx
	pop cx
	pop bx
	popf
endp

code ends	
end start