%include "asm_io.inc"
segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, 1
	mov ebx, 2
	mov ecx, 4
	mov edx, 8
	mov esi, 16
	mov edi, 32
here:	pusha
	mov ebp, 64
	mov eax, 100
	mov ebx, 200
	mov ecx, 300
	mov edx, 400
	popa	
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
