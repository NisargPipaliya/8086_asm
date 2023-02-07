data_here segment word public
	input_values dw 0035h,0855h,2011h,1359h
	scaled_values db 4 dup(0)
	scale_factor db 09h
	scale_div_flag db 0
data_here ends

stack_here segment stack
		dw 100 dup(0) 
		top_stack label word
stack_here ends

public bad_div_flag 
int_proc_here segment word public
extrn bad_div:far
int_proc_here ends

code_here segment word public

assume cs:code_here,ds:data_here,ss:stack_here
start:	mov ax,stack_hee
		mov ss,ax
		mov sp,offset top_stack
		mov ax,data_here
		mov ds,ax
		mov ax,0000
		mov es,ax
		mov word ptr es:0002,seg bad_div
		mov word ptr es:0000,offset bad_div
		mov si,offset input_values
		mov bx,offset scaled_values
		mov cx,0004h
next:	mov ax,[si]
		div scale_factor
		cmp bad_div_flag,01h
		jne ok
		mov byte ptr[bx],00
		jmp skip
ok:		mov [bx],al
skip:	mov bad_div_flag,0
		add si,02h
		inc bx
		loop next
stop:	nop
code_here ends 
end start		