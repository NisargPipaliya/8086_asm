data segment
BCD_INPUT db 17h
BIN_OUTPUT db ?
data ENDS

stack_seg  segment
DW 40 dup(0)
TOP_STACK label word
stack_seg ENDS

code segment
assume cs:code, ds:data , ss:stack_seg
start: mov ax,data
       mov ds,ax
	   mov ax,stack_seg
	   mov ss,ax
	   mov sp,offset top_stack
	   mov al,BCD_INPUT
	   call bcd_to_bin
	   mov BIN_OUTPUT,al
	   int 3h
	   
	   bcd_to_bin proc near
	   pushF
	   push bx
	   push cx
	   
	   ;conversion
	   mov bl,al
	   and bl,0fh
	   and al,0f0h
	   mov cl,04h
	   shr al,cl
	   mov bh,0ah
	   mul bh
	   add al,bl
	   
	   pop cx
	   pop bx
	   popF
	   ret
	   bcd_to_bin endp
code ENDS
END Start