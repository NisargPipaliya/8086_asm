data segment
    mes1 db "Enter string : $"
    buf db 25,256 dup(0)
    mes2 db 0dh,0ah, "Enter char : $"
    mes3 db 0dh,0ah,"Character not found $"
    mes4 db 0dh,0ah, "character found at : $"
data ends

print macro mes
    mov ah,9
    lea dx,mes  
    int 21h
endm

input macro mes
    mov ah,10
    lea dx, mes
    int 21h
endm


code segment
    assume cs:code,ds:data,es:data
start:  mov ax,data
        mov ds,ax
        mov es,ax

        print mes1
        input buf
        print mes2

        mov ah,1
        int 21h

        lea di,buf+1
        mov cx,0
        mov cl,byte ptr[di]
        inc di
        mov bx,di

        cld
repne scasb
      jnz skip

      print mes4
      sub di,bx
      mov dx,di
      add dl,'0'

      mov ah,2
      int 21h

      jmp over
skip :  print mes3

over : mov ax,4c00h
       int 21h
code ends
    end start