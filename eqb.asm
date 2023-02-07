data segment
    num dw 0aaaah
    ans db 0
data ends

code segment 
    assume cs:code,ds:data
start : mov ax,data
        mov ds,ax
        
        mov cx,16
        mov ax,num
next :  shl ax,1
        jnc skip
        inc ans
skip:   loop next
        mov ax,4c00h
        int 21h
code ends
     end start