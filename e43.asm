data segment
    n1 dw 1234h
    n2 dw 4321h
    ans db 00h
data ends

code segment
    assume cs:code, ds:data
start: 
    mov ax,data
    mov ds,ax

    mov ax,n1
    mov bx,n2

    xor ax,bx
    not ax

    mov cx,16
next:
    shr ax,1
    jnc skip

    inc ans
skip : loop next

    int 3
code ends
end start