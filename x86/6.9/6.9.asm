%include "asm_io.inc"
segment .data 
format db "The number is %d", 10
segment .bss 

segment .text
        global  asm_main
	extern printf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	call read_int
	dump_regs 1
	push eax
	call printnum
	pop eax
	dump_regs 2
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

printnum:
	push ebp
	mov ebp, esp
	push ecx
	push eax
	push edx
	push ebx

	mov ebx, 1; count index
	mov eax, 1; multiple to print
	mov edx, 0; number to add

init:
	inc edx
	mov ecx, [ebp+8]
	mov eax, edx
	mov edx, eax

top:
	;save registers
	push eax
	push ebx
	push ecx
	push edx
	
	push eax; calling printf
	push format
	call printf
	add esp, 8

	;restore registers
	pop edx
	pop ecx
	pop ebx
	pop eax

	add eax, edx

	loop top

	inc ebx
	cmp ebx, 10
	call print_nl
	jnz init


done:
	pop ebx
	pop edx
	pop eax
	pop ecx

	mov esp, ebp
	pop ebp
	ret
	

