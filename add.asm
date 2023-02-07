DATA_HERE SEGMENT
	d1 dw 1234h
	d2 dw 2000h
	ans dw ?
data_here ends

code_here segment
	assume cs:code_here,ds:data_here
	
start: mov ax,data_here
		mov ds,ax

		mov ax,d1
		mov bx,d2
		add ax,bx
		mov ans,ax
		
		int 3h
		
code_here ends
end start