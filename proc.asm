data segment public
    extrn num:word
data ends

public bin_cnt

code_proc segment public
    assume cs:code_proc,ds:data
bin_cnt proc far

    pushf
    push bx
    push cx
    push dx

    mov bx,num
    mov cx,16
    mov dx,0
next: shr bx,1
      jnc skip
      inc dx
skip: loop next
      mov ax,dx

      pop dx
      pop cx
      pop bx
      popf

      ret
bin_cnt endp

code_proc ends
    end