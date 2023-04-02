data segment
    str1 db "hello"
    str2 db 5 dup(0)
data ends

code segment
    assume cs:code,ds:data,es:data
start:
    mov ax,data
    mov ds,ax
    mov es,ax

    lea si,str1
    lea di, str2
    mov cx,0
    mov cl,5
repnz movsb

    int 3

code ends
end start