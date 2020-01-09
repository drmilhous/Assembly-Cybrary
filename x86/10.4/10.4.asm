%include "asm_io.inc"
segment .data 
sformat db "%[^", 10,"]s", 0
fred db "hello there ",0
segment .bss 
a resb 100
b resb 100
segment .text
        global  asm_main
	extern scanf
	extern strlen
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push a
	push sformat
	call scanf
	add esp, 8

	push a
	call strlen
	add esp, 4

	call print_int
	call print_nl
	mov ecx, eax
	mov edi, b
	mov esi, a		
	cld
upper:
	lodsb
	cmp al, 20h
	jle ok
	and al , 0DFh ; 1101 1111
ok:	stosb
	loop upper

	mov eax, b
	call print_string
	call print_nl

	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
