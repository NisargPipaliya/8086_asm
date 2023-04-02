data segment
    pwd db "aang"
    mes1 db "enter password: $"
    mes2 db "logged in : $"
    mes3 db "wrong password $"
    pin db 255,256 dup(0)
data ends

print macro mes
    mov ah,9
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
    lea dx,pin
    int 21H

    lea si,pwd
    lea di,pin
    inc di
    

    mov cx,0
    mov cl,byte ptr[di]
    inc di
    mov dx,0
    mov dl,4
    cmp cl,dl
    jnz er
    mov ax,0
    mov bx,0
    mov al,byte ptr[si]
    mov bl,byte ptr[di]
repe cmpsb
    jnz er
    print mes2
    jmp over
er: print mes3
over: int 3

code ends
end start