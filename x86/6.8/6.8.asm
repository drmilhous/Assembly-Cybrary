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
	mov ebp, 64
here:	pushad	
	mov eax, 20
	mov ebx, 30
	mov ecx, 40
	mov esi, 60
	mov edi, 80
	
	popad
			
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
