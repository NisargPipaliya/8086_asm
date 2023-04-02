data segment
    block dw 1111h,1234h,2345h,0001h
    ans dw ?
data ends

my_stack segment
    dw 100 dup(0)
    stack_top  label word
my_stack ends

code segment
    assume cs:code, ds:data,ss:my_stack
start:
    mov ax,data
    mov ds,ax
    mov ax,my_stack
    mov ss,ax
    lea sp,stack_top

    lea si,block
    mov cx,0
    mov cl,3

    mov ax,word ptr[si]
    add si,2
    mov bx,word ptr [si]
    add si,2
next: call minp
    mov bx,word ptr[si]
    add si,2
    loop next


    mov ans,ax
    int 3

minp proc
    pushf
    
    cmp ax,bx
    jnc skip
    jmp over
skip: mov ax,bx
over: popf
    ret
minp ENDP

code ends
end start