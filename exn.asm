data segment
    n dw 1234h
    ans dw 0
data ends

code segment
    assume cs:code ,ds:data
start : mov ax,data
        mov ds,ax

        mov ax,n
        mov cx,0
        mov cl,8
        rol ax,cl
        mov ans,ax

        mov ax,4c00h
        int 21h
code ends
    end start