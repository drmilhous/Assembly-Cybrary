%include "asm_io.inc"
segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push 0beefbeefh
	push 0cafecafeh
	call function
	add esp, 8		
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
function:
	push ebp	
	mov ebp, esp
	
	mov eax, 0

	mov esp, ebp
	pop ebp
	ret
