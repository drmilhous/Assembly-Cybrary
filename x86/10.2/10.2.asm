%include "asm_io.inc"
segment .data 
format db "The sum is %d",10, 0
segment .bss 
a resd 5
segment .text
        global  asm_main
	extern printf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov ecx, 5
	mov ebx, 0

read:	
	call read_int
	mov [a + ebx], eax
	add ebx, 4
	loop read

	mov ecx, 5 ; loop 5 times
	mov edx, 0 ; offset 	
	mov eax, 0 ; set sum to 0
sum:
	mov ebx, [a + edx] ;get value from array
	add eax, ebx ; add to sum		
	add edx, 4
	loop sum	; loop ecx number of times

	push eax
	push format
	call printf
	add esp, 8

	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
