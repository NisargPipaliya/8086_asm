data_here segment
   block DB 10h,20h,30h,40h,50h
   n DB 03h;
   result DW 5 dup(0)
data_here ends

code_here segment
  assume cs : code_here , ds: data_here
  start: mov ax,data_here 
         mov ds,ax
		 mov cx,05h
		 mov bl,n
		 mov si,offset block
		 mov di,offset result
		 
		 
  next:  mov al,byte ptr[si]
         mul bl
		 mov  word ptr[di] , ax
		 inc si
		 add di,2
		 loop next
		 
		 mov ax , 4200h
		 int 3
code_here ends
end start