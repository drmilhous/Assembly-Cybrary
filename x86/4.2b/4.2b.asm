%include "asm_io.inc"
segment .data 
prompt db "Enter the number of numbers:",0
enterPrompt db "Enter the next number:",0
sum db "The total is ",0
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
	mov ebx, 0

top:
	mov eax, enterPrompt
	call print_string
	call read_int
	cmp eax, -1
	jz done
	add ebx, eax
	loop top

done:
	mov eax, sum
	call print_string			
	mov eax, ebx
	call print_int
	call print_nl
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
