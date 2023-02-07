data segment word public
    dividend dw 1111h,1111h
    divisor  dw 0000h
data ends

data2 segment
   quotient dw 2 dup(0)
   remainder dw 0
data2 ends

stack_seg segment stack
     dw 100 dup(0)
     Top_stack label word
stack_seg ends

prodecure segment
     extrn  smart_div:far
prodecure ends

public divisor

code segment word public

 assume cs:code , ss:stack_seg , ds:data
 
  start:     mov ax,data
			 mov ds,ax
			 mov ax,stack_seg
			 mov ss,ax
			 mov sp,offset Top_stack
			 mov ax,dividend
			 mov dx,dividend + 2
			 mov cx,divisor
			 call smart_div
			 jnc  save_all
			 jmp stop
 save_all:	  assume ds:data2
              push ds
			  mov bx,data2
			  mov ds,bx
			  
			  mov quotient , ax
			  mov quotient + 2 , dx
			  mov remainder , cx
			  assume ds:data
			  pop ds
  stop:       int 3			  
code ends
end START