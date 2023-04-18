data segment
    temp dw 10h,20h,30h,40h,50h,60h,70h,80h,90h,99h
    ans dw  0
    ans2 dw 0
data Ends

code segment
    ASSUME cs:code, ds:data
start:
        mov ax,data
        mov ds,ax

        mov cx,0
        mov cl,0ah
        mov ax,0

        lea si,temp
next:   add ax,word ptr [si]
        inc si
        inc si
        loop next

        mov cx,0ah
        div cx
         
        mov ans,ax
        mov ans2,dx

        int 3
code Ends
end start