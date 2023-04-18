data segment
    mes1 db "Enter a hex number : $"
    mes2 db "Binary conversion is : $"
    strb db 255,256 dup(0)
    nl db 0ah,0dh,'$'
data ends

print macro mes
    mov ah,09
    lea dx,mes
    int 21h
endm

my_stack segment stack
    dw 100 dup(0)
    stack_top label word
my_stack ends


code segment
    ASSUME cs:code,ds:data,ss:my_stack
start :
        mov ax,data
        mov ds,ax
        mov ax,my_stack
        mov ss,ax
        lea sp,stack_top
       
        print mes1

        mov ah,10
        lea dx,strb
        int 21h

        lea si,strb+1
        mov bx,0
        mov bl,byte ptr[si]
        inc si
        mov cx,0
        mov cx,4
        mov ax,0

next1 :
        mov dx,0
        mov dl,byte ptr[si]
        cmp dl,'9'
        jle dig
        sub dl,39
dig:    sub dl,'0'
        shl ax,cl
        add ax,dx
        inc si
        mov cx,4
        dec bx
        jnz next1

        push ax
        print mes2
        pop ax

        mov cx,0
        mov bx,10
next2:  
        mov dx,0
        div bx
        push dx
        inc cx
        cmp ax,0
        jnz next2

        mov ah,2
next3: 
        pop dx
        add dx,'0'
        int 21h
        loop next3

        int 3
code ends
end start