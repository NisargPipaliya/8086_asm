data segment
    str1 db "hello"
data ends

extra segment
    str2 db 5 dup(0)
extra ends

code segment
    assume cs:code,ds:data,es:extra
start:
    mov ax,data
    mov ds,ax
    mov ax,extra
    mov es,ax

    lea si,str1
    lea di, str2
    mov cx,0
    mov cl,5
repnz movsb

    int 3

code ends
end start