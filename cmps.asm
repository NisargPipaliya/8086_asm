data segment
        str1 db "assembly"
        str2 db "assemblY"
        str3 db "assembly"
        mes1 db "strings are equal $"
        mes2 db "strings are not equal  $"
data ends

print macro mes
    mov ah,9
    lea dx,mes
    int 21h
endm

code segment
    assume cs:code,ds:data,es:data
start: mov ax,data
       mov ds,ax
       mov es,ax

       lea si,str1
       lea di,str2  ; try with str3

       cld

       mov cx,8
repe cmpsb
    jz done
    print mes2
    jmp over

done : print mes1
over : mov ax,4c00h
        int 21h
code ends
     end start