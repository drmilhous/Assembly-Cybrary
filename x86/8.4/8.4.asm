%include "asm_io.inc"
segment .data 
sformat db "%lf",0
ok db "Result ok",10,0
bad db "Result bad",10,0
y dq 1.234
x dq 99.9
pformat db "---%f---",10,0
segment .bss 
;x resq 1 
segment .text
        global  asm_main
	extern scanf
	extern printf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push x
	push sformat
	call scanf
	add esp, 8
	
	mov eax, [x+4]
	push eax	
	mov eax, [x]
	push eax
	push pformat
	call printf
	add esp, 0Ch	
	
	fld qword [x]; x = st1
	fld qword [y]; y = st0
r:	fcomip st0,st1 
	fstp
	ja equal; y is bigger than x
	jmp notequal


equal:
	mov eax, ok
	call print_string	
	jmp done
notequal:	
	mov eax, bad
	call print_string
	jmp done
done:	
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
