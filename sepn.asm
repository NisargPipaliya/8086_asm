data segment
    n dw 1234h
    ans db 4 dup(0)
data ends

code segment
    assume cs:code ,ds:data
start : mov ax,data
        mov ds,ax

        mov ax,n
        mov cx,0
        mov cl,4

        mov bx,4;
        lea si,ans
        mov dx,ax
        and dx,000fh
        mov byte ptr[si],dl
        inc si
        
next :  shr ax,cl
        mov dx,ax
        and dx,000fh
        mov byte ptr[si], dl
        inc si
        mov cl,4
        dec bx
        jnz next

        mov ax,4c00h
        int 21h
code ends
    end start