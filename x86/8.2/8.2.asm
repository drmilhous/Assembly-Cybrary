%include "asm_io.inc"
segment .data 
pi dq 3.141592653
x dd 0
area dq 0
cir dq 0
two dd 2

sformat db "%d", 0
pformat db "The area as %f the circumference is %f",10,0
segment .bss 

segment .text
        global  asm_main
	extern scanf
	extern printf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push x ; scanf for x
	push sformat
	call scanf
	add esp, 8

	fld qword [pi]; area calculation
	fimul dword [x]
	fimul dword [x]
	
	fstp qword [area]

	fldpi ;circ calculation 
	fimul dword [two]
	fimul dword [x]
	
	fstp qword [cir]

	;printing 
	mov eax, [cir+4]; load cir
	push eax
	mov eax, [cir]
	push eax

	mov eax, [area + 4]
	push eax
	mov eax, [area]
	push eax
	
	push pformat
	call printf
	add esp, 14h



	
	
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
