_TEXT SEGMENT BYTE PUBLIC 'CODE'
public _add
         ASSUME CS: _TEXT
		 _add PROC NEAR
		      PUSH BP
			  MOV BP,SP
			  MOV AX,WORD PTR[BP+4]
			  ADD AX,WORD PTR[BP+6]
			  POP BP
			  RET
	    
        _add endp
		int 3
   _TEXT ENDS
END   