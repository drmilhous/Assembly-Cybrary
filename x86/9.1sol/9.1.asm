%include "asm_io.inc"
%define one [ebp+8]
%define two [ebp+0Ch]
%define three [ebp+10h]
%define max [ebp-8]

sformat  db "%d %d %d",0
segment .data 

segment .bss 
arr resd 3
segment .text
        global  asm_main
	extern scanf
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, arr; load the address of arr
	push eax
	add eax, 4; add 4 to the address
	push eax
	add eax, 4; add 8 to the address
	push eax
	push sformat
	call scanf
	add esp, 14h
	

	mov eax, [arr]; load arguments
	push eax
	mov eax, [arr+4]
	push eax
	mov eax, [arr + 8]
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
	push ebx
	push ecx
	push edx
	mov eax, one
	mov ebx, two
	mov ecx, three
	cmp eax, ebx
	ja a1; eax is bigger
	mov max, ebx; ebx is bigger
	jmp parttwo
a1:
	mov max, eax
	jmp parttwo
parttwo:
	mov eax, max; load max in eax
	cmp eax, ecx
	ja b1; eax is bigger
	mov max, ecx	;ecx is bigger
	jmp done
b1:
	mov max, eax
	jmp done
	
done:	mov eax, max; copy result to return
	pop edx
	pop ecx
	pop ebx
	leave
	ret
