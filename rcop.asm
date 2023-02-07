data segment 
    s1 db "NISARG"
    s2 db 15 dup(0),'$'
data ends


print macro mes
    mov ah,9
    lea dx,mes
    int 21h
endm


code segment
    ASSUME cs:code,ds:data,es:data
start: mov ax,data
       mov ds,ax
       mov es,ax

       lea si,s1
       lea di,s2
       cld
       mov cx,6
rep    movsb

    print s2
    mov ax,4c00h
    int 21h
code ends
    end start