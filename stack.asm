data segment
 input_data db 17H;
 output db ?
data  ends


stack_seg segment
  dw  40 dup(0)
  TOP_STACK label word;
stack_seg  ends   


code segment 
assume cs:code ,ds:data , ss:stack_seg

start:   mov ax,data
         mov ds,ax;
		 mov ax,stack_seg
		 mov ss,ax
		 mov sp,offset TOP_STACK
		 mov al,input_data
		 push ax;
		 call bcd_to_bin
		 pop ax;
		 mov  output,al
		 int 3h
		 
		 bcd_to_bin proc near
		 pushf
		 push ax
		 push bx
		 push cx;
		 push bp;
		 mov bp,sp;
		 mov ax,[bp +12]
		 
		 ;do the conversion
		 
		 mov bl,al
		 and bl,0fh
		 and al,0f0h
		 mov cl,04h
		 shr al,cl
		 mov bh,0ah
		 mul bh
		 add al,bl
		 ;end of conversion
		 ;binary result in in al
		 
		 mov [bp+ 12],ax;
		 pop bp;
		 pop cx;
		 pop bx;
		 pop ax;
		 popf;
		 ret
		 bcd_to_bin endp
		 code ends
		 end start