data segment
    mes1 db "enter string : $"
    mes2 db "Enter chaaracter : $"
    mes3 db "Char not found. $"
    mes4 db "char found at : $"
    buf db  10,11 dup(0)
    nl db 0dh,0ah,'$'
data ends

print macro mes
    mov ah,9
    lea dx,mes
    int 21H
endm

code segment
    assume cs:code,ds:data,es:data
start: 
    mov ax,data
    mov ds,ax
    mov es,ax

    print mes1

    mov ah,10
    lea dx,buf
    int 21H

    print nl

    print mes2
    mov ah,1
    int 21H

    lea di,buf+1
    mov cx,0
    mov cl,byte ptr[di]

    inc di

    mov bx,di
repne scasb

    jnz skip
    print nl
    print mes4
    sub di,bx
    mov dx,di
    add dl,'0'
    mov ah,2
    int 21H
    jmp over
skip:   print mes3
over:   int 3
code ends
end start