data segment
    a db 1
    b db 2
    ans db ?
data ends

code segment
    assume cs:code,ds:data
start:  
    mov ax,data
    mov ds,ax

    mov al,a
    mov bl,b

    not al
    not bl
    
    and al,Bl

    not al

    mov ans,al

    int 3
code ends
end start