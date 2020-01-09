%include "asm_io.inc"
segment .data 
%define one [ebp+8]
%define two [ebp+0ch]
%define three [ebp+10h]
%define max [ebp-4]
sformat db "%d %d %d",0

segment .bss 
arr resd 3
segment .text
        global  asm_main
	extern scanf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, arr; get base address
	push eax
	add eax, 4; add 4 to the address
	push eax
	add eax, 4; add 8 to base address
	push eax
	push sformat
	call scanf
	add esp, 10h

	mov eax, [arr]
	push eax
	mov eax, [arr+4]
	push eax
	mov eax, [arr+8]
	push eax
	call maxthree
	add esp, 0ch
	call print_int
	call print_nl

	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
maxthree:
	enter 0,4
	push ebx; save registers
	push ecx
	push edx
	
	mov eax, one; [ebp + 8]
	mov ebx, two
	mov ecx, three
	
	; do comparision
	cmp eax, ebx; compare eax and ebx
	cmova edx, eax;eax is bigger
	cmovbe edx, ebx; ebx is bigger
	cmp edx, ecx
	cmovbe edx, ecx
	mov eax, edx

	pop edx;restore registers
	pop ecx
	pop ebx
	leave 
	ret
