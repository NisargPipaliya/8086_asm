data segment
    n1 dw 1234h
    n2 dw 4321h
data ends

exg macro 
    push cx
    mov cx,ax
    mov ax,bx
    mov bx,cx
    pop cx
endm

my_stack segment stack
    dw 20 dup(0)
    stack_top label word
my_stack ends

code segment
    assume cs:code, ds:data,ss:my_stack
start: mov ax,data
       mov ds,ax
       mov ax,my_stack
       mov ss,ax
       mov sp,stack_top


       mov ax,n1
       mov bx,n2

       exg

       mov n1,ax
       mov n2,bx
       
       mov ax,4c00h
       int 3
code ends
     end start