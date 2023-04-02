data segment
    n db 10
    ans dw ?
data ends

code segment
    assume cs:code, ds:data
start:
        mov ax,data
        mov ds,AX
        mov ax,0
        mov cx,0

        mov cl,n
next:  add ax,cx
        loop next

        mov ans,ax

        int 3
code ends
end start