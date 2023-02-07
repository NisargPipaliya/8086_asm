data segment 
    n1 dw 1234h
    n2 dw 1235h
    ans db 0
data ends

code segment
    assume cs:code,ds:data
start : mov ax,data
        mov ds,ax

        mov ax,n1
        mov bx,n2
        xor ax,bx
        mov cx,16
next :  shl ax,1
        jc skip
        inc ans
skip:   loop next

        mov ax,4c00h
        int 21h
code ends
     end start