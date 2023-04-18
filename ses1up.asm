data segment
        mes db "Enter string in lowercase : $"
        nl db 0ah,0dh,'$'
        strb db 255,256 dup(0)
        mes2 db 'UpperCase string is : $'
        table_t db "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
data ends


print macro mes
    mov ah,09h
    lea dx,mes
    int 21h
endm

code segment 
    ASSUME cs:code, ds:data
start:
    mov ax,data
    mov ds,ax

    print mes

    mov ah,10
    lea dx,strb
    int 21h

    print nl

    lea bx,table_t
    lea si,strb+1
    mov cx,0
    mov cl,byte ptr[si]

next:
    inc si
    mov al,byte ptr[si]
    sub al, 'a'
    xlat
    mov byte ptr[si],al
    loop next
    inc si

    mov byte ptr[si],'$'

    print mes2

    print nl
    mov ah,09h
    lea dx,strb+2
    int 21h

    int 3
code ends
end start