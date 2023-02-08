data segment
    arr db 10,0ah,9,8,7,6,5,4,3,2,1
    ans db 0
data ends

my_stack segment stack
    dw 40 dup(0)
    stack_top label word
my_stack ends

code segment
    assume cs:code,ds:data,ss:my_stack
start:  mov ax,data
        mov ds,ax
        mov ax,my_stack
        mov ss,ax
        mov sp,stack_top

        lea si,arr
        inc si
        call funct

        mov ax,4c00h
        int 3

funct proc near
    pushf
    push ax
    push cx

    mov cx,0
    mov cl,byte ptr[si]
    dec cx
    mov al,byte ptr[si]
next: inc si
      cmp al, byte ptr[si]
      jc skip
      mov al,byte ptr[si]
skip: loop next

    mov ans,al

    pop cx
    pop ax
    popf
    ret
funct endp

code ends
    end start