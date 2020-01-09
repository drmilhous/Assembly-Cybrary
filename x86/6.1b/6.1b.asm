%include "asm_io.inc"
segment .data 
hello db "Hello world",0
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, hello
	call print_string
	call print_nl
	mov eax, hello
	add eax, 6
	mov BYTE [eax],'W'
	mov eax, hello
	call print_string
	call print_nl
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
