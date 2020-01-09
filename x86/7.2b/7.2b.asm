%include "asm_io.inc"
segment .data 
sformat db "%d",0
pformat db "The sum is %d",10, 0
segment .bss 

segment .text
        global  asm_main
	extern printf
	extern scanf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	sub esp, 4
	lea eax, [esp]
	push eax
	push sformat
	call scanf
	add esp, 8
	mov eax, [esp]
	push eax
	call foo
	add esp, 4
	
	push eax
	push pformat
	call printf
	add esp, 8

	add esp, 4	
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

foo:
	push ebp
	mov ebp, esp
	sub esp, 8
	
	push ecx; save registers
	push edx

	mov dword [ebp-4], 0 ; sum
	mov dword [ebp-8], 0 ; i
	
check: ; check that i < n
	mov ecx, [ebp+8]; parameter 1
	mov edx, [ebp-8]; i 
	cmp edx, ecx
	jg done
	
	mov eax, [ebp-4]; sum += i 
	add eax, edx
	mov [ebp-4], eax

	mov edx, [ebp-8]
	inc edx
	mov [ebp-8], edx
	jmp check

done:
	mov eax, [ebp-4]; return sum


	pop edx;restore registers
	pop ecx
	add esp, 8; deallocate variables
	mov esp, ebp; epilogue
	pop  ebp
	ret


