%include "asm_io.inc"
segment .data 
prompt db "Enter the shift amount:", 0
prompt2 db "Enter the number:",0
result db "The result of the shift is:",0
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
	mov ebx,-1
	shrd eax, ebx, cl
	dump_regs 0
	mov ebx, eax
	mov eax, result
	call print_string
	mov eax, ebx
	call print_int
	call print_nl
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
