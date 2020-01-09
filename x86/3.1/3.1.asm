%include "asm_io.inc"
segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, 0Ah
	mov ebx, 2
	mov ecx, 3
	mov edx, 0FEEDBEEFh
	mul bl
	dump_regs 1
		
	mov eax, 0Ah
	mov ebx, 2
	mov ecx, 3
	mov edx, 0FEEDBEEFh
	mul cx
	dump_regs 2
	
	mov eax, 0Ah
	mov ebx, 2
	mov ecx, 3
	mov edx, 0FEEDBEEFh
	mul ebx
	dump_regs 3
	
	mov eax, 0Ah
	mov ebx, -2
	mov ecx, 3
	mov edx, 0FEEDBEEFh
	imul eax, ebx
	dump_regs 4
	call print_int
	call print_nl
	
	mov eax, 100
	mov ebx, 7
	mov ecx, 3
	mov edx, 0FFh  ;Zero out or else
	div ebx
	dump_regs 5

	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
