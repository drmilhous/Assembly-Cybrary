%include "asm_io.inc"
segment .data 
format db "The value is %d", 10, 0
segment .bss 

segment .text
        global  asm_main
	extern printf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push 3
	call rec
	pop eax
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

rec:
	push ebp
	mov ebp, esp

	mov eax, [ebp+8]
	cmp eax, 0
	jz done
	
	dec eax
	push eax; save register
	push eax; arg 1 to the recursive function
	call rec
	add esp, 4
	pop eax; restore register
	; printing
	push eax
	push format
	call printf
	add esp, 8


done:
	mov esp, ebp
	pop ebp
	ret

