%include "asm_io.inc"
segment .data 

segment .bss 

segment .text
        global  lenstring
lenstring:
        enter   0,0               ; setup routine
	push edi
	push ecx

	mov eax, 0
	mov edi, [ebp + 8]
	mov ecx, [ebp + 0Ch]
	cld 
	repne scasb
	
	mov ecx, [ebp + 8]
	mov eax, edi
	sub eax, ecx
	dec eax

	pop ecx
	pop edi
	leave                     
        ret
