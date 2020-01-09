%include "asm_io.inc"
segment .data 
var1 dd 0
var db "Hello Class!",0
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, var1
	call print_int
	call print_nl
	mov eax, [var1]
	call print_int
	call print_nl	
	mov al,[var]
	dump_regs 0
	mov ax, [var]
	dump_regs 1
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
