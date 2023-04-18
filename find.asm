data segment
    mes1 db 'Enter String : $'
    mes2 db 'Enter Character :$'
    strb db 255,256 dup(0)
    mes3 db 'Not Found :$'
    mes4 db 'Found at : $ '
    nl   db 0ah,0dh,'$'
data ends


print macro mes
        mov ah,09h
        lea dx,mes
        int 21h
endm

code segment
    ASSUME cs:code, ds:data,es:data
start:
        mov ax,data
        mov ds,ax
        mov es,ax

        print mes1

        mov ah,10
        lea dx,strb
        int 21h

        print nl

        print mes2

        mov ah,1
        int 21h

        lea di,strb+1
        mov cx,0
        mov cl,byte ptr[di]   
        inc di
        mov bx,di
        cld
repne   scasb
        print nl
        jnz over

        sub di,bx
        print mes4
        
        mov dx,di
        add dl,'0'

        mov ah,02
        int 21h
        jmp ov2
over: print mes3

ov2:        int 3

code ends 
end start