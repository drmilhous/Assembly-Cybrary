%include "asm_io.inc"
segment .data 
a dq 1.2
b dq 3.1
af db "A is bigger",10,0
bf db "B is bigger",10,0
sformat db "%f",0
segment .bss 

segment .text
        global  asm_main
	extern scanf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************

	push b
	push sformat
	call scanf
	add esp, 8
	
zz:	fld qword [a] ;ST0
	fld qword [b] ;ST1
	fcomip st1
	jbe aa
	mov eax, bf
	jmp print

aa:	mov eax, af	
		

print:
	call print_string	
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
