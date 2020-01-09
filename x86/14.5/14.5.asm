%include "asm_io.inc"
segment .data 
struc myTime
	.tv_sec: resd 1
	.tv_nsec: resd 1
endstruc

format db "The time is %ld seconds and %ld nanoseconds", 10,0 

segment .bss 

segment .text
	extern printf
	extern malloc
	extern clock_gettime
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov ebp, esp
	sub esp, 4
	
	push 8h
	call malloc
	add esp, 4
	mov [ebp-4],eax

	push eax
	push 0
	call clock_gettime
	add esp, 8

	mov ebx, [ebp-4]
	mov eax, [ebx + myTime.tv_nsec]
	push eax
	mov eax, [ebx + myTime.tv_sec]
	push eax
	mov eax, format
	push eax
	call printf
	add esp, 0Ch

	add esp, 4



	
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
