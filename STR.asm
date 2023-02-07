data_here segment
 ans db ?
 ch1 db 'H'
 mess db "hello how are you"
 buffer db 256 dup(0)
data_here ends
code_here segment
  assume cs: code_here ,ds: data_here
start: mov ax,data_here
       mov ds,ax
	   ;mov dx,offset mess
	   mov dx,offset buffer
	   mov ah,0Ah
	   ;mov dl,ch1
       int 21h
	   ;mov ans,al
	   int 3
code_here ends
end start