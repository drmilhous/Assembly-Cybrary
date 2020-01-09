%include "asm_io.inc"
segment .data 
a: dq 0
format : db "Time %llu", 10, 0
segment .bss 

segment .text
	extern printf
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	rdtsc
	mov ebx, a
	mov [ebx], eax
	add ebx, 4
	mov [ebx], edx

	mov eax, [a+4]
	push eax
	mov eax, [a]
	push eax
	mov eax, format
	push eax
	call printf
	add esp, 12
		
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
