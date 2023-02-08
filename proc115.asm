data segment
    mes db "HELLO WORLD$"
data ends

my_stack segment stack
    dw 10 dup(0)
    stack_top label word
my_stack ends

;print macro mes
      ;mov ah,9
      ;lea dx,mes
     ; int 21h
    ;endm
    ;can print message from macro too.
    
code segment 
    assume cs:code,ds:data,ss:my_stack
start: 
        mov ax,data
        mov ds,ax
        mov ax,my_stack
        mov ss,ax
        lea sp,stack_top

        mov cx,5
next:   ;print mes
        call pro
        loop next

        mov ax,4c00h
        int 3

    pro proc near
        mov ah,9
        lea dx,mes
        int 21h
        ret
    pro endp

code ends
    end start