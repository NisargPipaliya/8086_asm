data segment
        mes1 db "Enter hex number : $"
        buf db 5,6 dup(0)
        mes2 db 0dh,0ah,"Decimal of given hex is : $ "
data ends


print macro mes
    mov ah,9
    lea dx,mes
    int 21h
endm

input macro  mes
    mov ah,10
    lea dx,mes
    int 21h
endm

code segment
    assume cs:code ,ds:data
start : mov ax,data
        mov ds,ax

        print mes1
        input buf
        lea si,buf+1
        mov bx,0
        mov bl,byte ptr[si]
        inc si
        MOV cx,4
        mov ax,0
next:   mov dx,0
        mov dl,byte ptr[si]
        cmp dl,'9'
        je digit
        sub dl,39
digit: sub dl,'0'
        shl ax,cl
        add ax,dx
        inc si
        dec bx
        jnz next

        push ax

        print mes2

        pop ax
        mov cx,0
        mov bx,10
next1 : mov dx,0
        div bx
        push dx
        inc cx
        cmp ax,0
        jnz next1

        mov ah,2
next2:  pop dx
        add dx,'0'
        int 21h
        loop next2

        mov ax,4c00h
        int 21h
code ends   
    end start