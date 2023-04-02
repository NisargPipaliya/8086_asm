;exp 10 in journal
data segment public
   extrn divisor:word
data ends

public smart_div

prodecure segment public
  smart_div proc near
  assume cs:prodecure , ds:data
  cmp divisor,0h
  je  error_exit
  mov bx,ax
  mov ax,dx
  mov dx,0000h
  div cx
  mov bp,ax
  mov ax,bx
  div cx
  mov cx,dx
  mov dx,bp
  clc
  jmp exit
  error_exit: stc
  exit:ret
  smart_div endp
prodecure ends
end