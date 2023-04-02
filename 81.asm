data segment
    n db 12h
    ans dw ?
data ends

my_stack segment
    dw 100 dup(0)
    stack_top label word
my_stack ends


code segment
    assume cs:code, ds:data, ss:my_stack
start:
    mov ax,data
    mov ds,ax
    mov ax,my_stack
    mov ss,ax
    lea sp,stack_top

    mov ax,0
    mov al,n

    call bcd

    mov ans,AX
    int 3

bcd proc near
    pushf
    push cx
    push bx

    mov bx,0
    mov bl,al
    and bl,0fh
    and al,0f0h
    mov cx,0
    mov cl,4

    shr al,cl

    mov bh,0ah
    mul bh
    add al,bl

    pop cx
    pop bx
    popf
    ret
endp

code ends
end start