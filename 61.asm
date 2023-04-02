data segment 
    mes1 db "enter lower case string : $"
    mes2 db "upper case string is : $"
    nl db 0dh,0ah,'$'
    strb db 255,256 dup(0)
    tablea db "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
data ends

print macro mes
    mov ah,09
    lea dx,mes
    int 21H
endm

code segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    print mes1

    mov ah,10
    lea dx,strb
    int 21H

    lea bx,tablea
    lea si,strb+1
    mov cx,0
    mov cl,byte ptr[si]
next:
    inc si
    mov al,[si]
    cmp al,' '
    jz skip

    sub al,'a'
    xat
    mov byte ptr[si],al
skip:loop next
    inc si
    mov byte ptr[si],'$'

    print nl
    print mes2
    print strb

    int 3
code ends
end start