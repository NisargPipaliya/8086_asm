_TEXT segment byte public
public tarea
	assume cs:_TEXT
start:	 tarea proc far
	   push bp
	   mov bp,sp
	   mov ax,word ptr [bp+1]
	   mov dx,word ptr[bp+1]
	   mul dx
	   mov dx,2
	   div dx
	   pop bp
	   ret 
         tarea endp
   INT 3h;
_TEXT ends
end start
     
	