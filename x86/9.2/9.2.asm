%include "asm_io.inc"
%define min [ebp-4]
%define max [ebp-8]
segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push 1
	push 5
	push 3
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
	enter 0,8
	push ebx
	push ecx
	push edx
	mov eax, [ebp+8]
	mov ebx, [ebp+0Ch]
	mov ecx, [ebp+10h]
	cmp eax, ebx ; comare eax and ebx
	cmova edx, eax; ; if eax is bigger
	cmovbe edx, ebx; if ebx is bigger
	cmp edx, ecx; compare ecx and edx
	cmovbe edx, ecx; if ecx is bigger
	
	mov eax, edx
	pop edx
	pop ecx
	pop ebx
	leave
	ret
