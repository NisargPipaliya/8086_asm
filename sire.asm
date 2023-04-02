data segment
mes db  'YES, I CAN DO IT$'
data Ends

stack_here SEGMENT stack
DW 20 dup(0)
stack_top LABEL WORD 
stack_here Ends

code SEGMENT
ASSUME cs:code, ds:data, ss:stack_here
start:
mov ax,data
mov ds,ax
mov ax,stack_here
mov ss,ax
mov sp , OFFSET stack_top
mov ax,0000h
mov es,ax

mov WORD PTR ES:0020h, OFFSET prt_mes
mov WORD PTR ES:0022h, SEG prt_mes
int 8
INT 3

prt_mes PROC FAR
push ax
push dx
mov ah,9
lea dx,mes
int 21h
pop dx
pop ax
IRET
prt_mes ENDP
code ENDS
END Start







