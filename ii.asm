data segment
input db 17
bin_output db ? 
data ends

stack_seg segment
dw 40 dup(0)
top_stack label word
stack_seg ends

code segment
 assume cs: code, ds: data,  ss: stack_seg
 start:  mov ax,data
		 mov ds,ax
		 mov ax,stack_seg
		 mov ss,ax
		 mov sp,top_stack
		 call bcd_to_bin
		 int 3h
		 
		 bcd_to_bin proc near
		 pushf
		 push bx
		 push cx
		 
		 ;conversion
		 mov al,input
		 mov bl,al
		 and bl,0fh
		 and al,0f0h
		 mov cl,04h
		 shr al,cl
		 mov bh,0ah
		 mul bh
		 add al,bl
		 mov bin_output,al
		 pop cx
		 pop bx
		 popf
		 ret
		 bcd_to_bin endp
code ends
end start

