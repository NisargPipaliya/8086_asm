data_here segment word public
	extrn bad_div_flag:byte
data_here ends

public bad_div

int_proc_here segment word public
	bad_div proc far
		assume cs:int_proc_here,ds:data_here
		MOV bp,sp
		add word ptr[bp+0],0004h
		mov sp,bp
		push ax
		push ds
		mov ax,data_here
		mov ds,ax
		mov bad_div_flag,01
		pop ds
		pop ax
		iret
	bad_div endp
int_proc_here ends
end