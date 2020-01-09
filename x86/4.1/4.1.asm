%include "asm_io.inc"
segment .data 
ten db "You entered 10", 10,0
other db "Incorrect!", 10,0
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	call read_int
	cmp eax, 10
	jz tenLabel
	mov eax, other
	jmp print
tenLabel:
	mov eax, ten

print:	call print_string
			
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
