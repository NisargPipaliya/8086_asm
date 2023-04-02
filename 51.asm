data segment
    arr db 10,9,8,7,6,5,4,3,2,1
    ans db ?
data ends

code segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    lea si,arr
    cld
    mov cx,9
    mov ax,0
    mov al,byte ptr[si]
    inc si
    mov bx,0
next: 
    mov bl,byte ptr[si]
    inc si
    cmp bx,ax
    jnc skip
    mov ax,bx
skip: loop next

    mov ans,al
    int 3
code ends
end start