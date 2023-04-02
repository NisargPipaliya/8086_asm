data segment
    arr dw 5,5,4,3,2,1
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax,data
    mov ds,ax

    lea si,arr
    mov bx,word ptr[si]
    add si,2
outer:
    mov di,si
    sub bx,01
    mov cx,bx

inner:  
    mov dx,word ptr[di+2]
    cmp word[di],DX
    jc lab
    mov ax,word ptr[di]
    xchg ax, word ptr[di+2]
    mov word ptr[di],ax
lab:
    add di,2
    loop inner
    cmp bx,1
    jnz outer

    int 3
code ends
end start