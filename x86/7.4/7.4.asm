%include "asm_io.inc"
segment .data 
sformat db "%d",0
pformat db "The sum is %d",10,0
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
	%push context
	%stacksize flat
	%assign %$localsize 0
	%arg n:dword
	%local i:dword, sum:dword
	enter %$localsize, 0
	push ecx
	push edx

	mov dword [sum], 0; sum
	mov dword [i],0; i

check:; check i <=n
	mov ecx, [n]; n
	mov edx, [i]; i
	cmp edx, ecx
	jg done
	
	mov eax, [sum]; sum += i
	add eax, edx
	mov [sum], eax

	mov edx, [i]; i++
	inc edx
	mov [i], edx
	jmp check

done:
	mov eax, [sum]; return sum

	pop edx; restore registers
	pop ecx

	add esp, 8; fix stack

	leave
	ret	
%pop 
