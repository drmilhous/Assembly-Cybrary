%include "asm_io.inc"
segment .data 
format db "0x%08X",10
segment .bss 

segment .text
        global  asm_main
	extern printf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	call read_int
	push eax
	call read_int
	push eax
	call printHex
	add esp, 8
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
printHex:
	push ebp
	mov ebp, esp
	
	mov eax, [ebp+8]
	push eax
	mov eax, format
	push eax
	call printf
	add esp, 8

	mov eax, [ebp+0Ch]
	push eax
	push format
	call printf
	add esp, 8


	mov ebp, esp
	pop ebp
	ret
