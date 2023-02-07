data segment
    bin_input db 17h
    bin_output db 00
data ends

my_stack segment stack
    dw 40 dup(0)
    stack_top label word
my_stack ends


code segment
    assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
        mov ax,my_stack
        mov ss,ax
        lea sp,stack_top

        mov ax,0
        mov al,bin_input
        call bcd_to_bin
        mov bin_output,al
        
        mov ax,4c00h
        int 3
bcd_to_bin proc near
    pushf
    push bx
    push cx
    mov bl,al
    and bl,0fh
    and al, 0f0h
    mov cl,04h
    shr al,cl

    mov bh,0ah
    mul bh
    add al,bl

    pop cx
    pop bx
    popf

    ret
bcd_to_bin endp
    code ends
    end start