data segment public
     num dw 0aaaaH
     count db ?
data ends

public num

my_stack segment stack
    dw 70 dup(0)
    stack_top label word
my_stack ends

code_proc segment public
    extrn bin_cnt:far
code_proc ends

code segment
    assume cs:code,ds:data,ss:my_stack
start : mov ax,data
        mov ds,ax
        mov ax,my_stack
        mov ss,ax
        mov sp,stack_top

        call bin_cnt
        mov count,al
        mov ax,4c00h
        int 3
code ends
    end start