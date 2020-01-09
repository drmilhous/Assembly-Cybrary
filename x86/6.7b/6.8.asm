%include "asm_io.inc"
segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push 7
	push 3
	dump_regs 1
	call mod
	add esp, 8
	dump_regs 2
	call print_int
	call print_nl	
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
mod:
	push ebp
	mov ebp, esp
	
	push ecx
	push edx
	
	mov ecx, [ebp+8]; 3
	mov eax, [ebp+0Ch] ; 7
	mov edx, 0
	div ecx
	mov eax, edx
	
	pop edx
	pop ecx

	mov esp, ebp	
	pop ebp
	ret
	
	
