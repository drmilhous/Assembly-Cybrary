%include "asm_io.inc"
segment .data 
prompt db "Enter the number:",0
prompt2 db "Enter the shift amount:",0
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, prompt
	call print_string
	call read_int
	mov ecx, eax
	mov eax, prompt2
	call print_string
	call read_int
	; eax = shift amount
	; ebx = number
	dump_regs 0
	shr ebx, cl
	dump_regs 1
	mov eax, ebx
	call print_int
	call print_nl
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
