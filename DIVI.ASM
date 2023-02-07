data_here segment word public
	input values dw 0035H,0855H,2011H,1359H
	value db 3 dup(0)
	factor db 15h
	flag db 0
data_here ends

stack_seg segment
	dw 100 dup(0)
	top_stack label word
stack_here ends

public bad_div_flag
int_proc_here segment word public
extrn bad_div:far
int_proc_here ends 