%include "asm_io.inc"
segment .data 
prompt db "Enter a character:",0
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, prompt
	call print_string
	call read_char
	movzx ebx, al
	stc 
	dump_regs 0
	rcl ebx, 4
	dump_regs 1
	rcr ebx, 4
	dump_regs 2	
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
