%include "asm_io.inc"
segment .data 
struc myTime
	.tv_sec: 	resd 1
	.tv_nsec:	resd 1
endstruc

format db "The time is %ld seconds and %ld nanoseconds", 10,0

segment .bss 

segment .text
	extern printf
	extern clock_gettime
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push 0xAABBCCDD
	push 0x0
	push 0x0
	mov ebp, esp
	lea eax, [ebp]
	push eax
	push 0
	call clock_gettime	

	mov eax, [ebp + myTime.tv_nsec]
	push eax
	mov eax, [ebp + myTime.tv_sec]
	push eax
	mov eax, format
	push eax
	call printf
	add esp, 0Ch
	add esp, 14h
	
	
	
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
