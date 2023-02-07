data segment 
 input db 04h
 output db ?
data ends

stack_seg segment 
 dw 40 dup(0)
 top_stack label word
stack_seg ends

code segment 
 assume ds:data , cs:code , ss:stack_seg
 
start:	 mov ax,data
		 mov ds,ax
		 
		 mov ax,stack_seg
		 mov ss,ax
		 mov sp, offset top_stack
		 mov al,input
		 push ax
		 call fact 
		 pop ax 
		 mov output,al
		 int 3h
 
 fact proc near
     cmp bx,1
	 je l1
	 
	 push  bx
	 dec bx
	 call fact
	 
	 pop bx
	 mul bx
	 
	 l1: ret
	 fact endp
 
code ends 
end start