code segment
    assume cs:code

    org 100 ; as first 256(0-255) bytes are reserved and we need to start from 257th byte for generating compact file
            ; having issues in turbo assembler while no issues in microsoft assembler
start : jmp skip
        ;local data segment
        n1 dw 1234h
        n2 dw 4321h
        ans dw ?
skip:  mov ax,n1
       mov bx,n2

       add ax,bx

       mov ans,ax

       mov ax,4c00h
       int 3
code ends
     end start