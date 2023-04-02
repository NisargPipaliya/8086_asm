data SEGMENT
    mes db 'YES,I can do it $'
data ENDS

my_stack SEGMENT stack
    dw 100 dup(0)
    stack_top label WORD
my_stack ENDS

code SEGMENT
    ASSUME cs:code,ds:data,ss:my_stack
start:
        mov ax,data
        mov ds,ax

        mov ax,my_stack
        mov ss,ax

        lea sp,stack_top

        mov ax,00h
        mov es,ax

        mov WORD ptr es:0022h,seg udn
        mov WORD ptr es:0020h,offset udn

        int 8h
        int 3

udn PROC far
    pushf
    mov ah,09h
    lea dx,mes
    int 21h
    popf
    iret
udn ENDP

code ENDS
    end start