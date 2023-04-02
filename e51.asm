data segment
    n db 5
    ans dw ?
data ends

code segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    mov cx,0
    mov cl,n
    mov ax,1
next:
    mul cx
    loop next

    mov ans,ax
    int 3
code ends
end start