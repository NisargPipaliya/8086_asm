data segment
    num db 0004h
    fact dw ?
data ends

my_stack segment stack
    dw 80 dup(0)
    stack_top label word
my_stack ends

code segment
    assume cs:code, ds:data,ss:my_stack
start: mov ax,data
       mov ds,ax
       mov ax,my_stack
       mov ss,ax
       mov sp, stack_top

       mov ax,1
       mov bx,0
       mov bl,num
       call facto
       mov fact,ax

       int 3

    facto proc near
            cmp bx,1
            je over

            push bx
            dec bx

            call facto

            pop bx 
            mul bx
    over:   ret
    facto endp

code ends
    end start