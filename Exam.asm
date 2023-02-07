_text segment word public
	dgroup group _text, _bss
_text ends

_data segment word public
	extern op1
	extern op2
	extern op3
_data ends

_text public
_code segment word public
 assume ds:_data, cs:_code
 proc fun near
        mov al,op1
		add al,op2
		mul op3
		mov res,al
	ret
fun	endp
_code ends
_bss segment word public
	extern res
_bss ends	
end