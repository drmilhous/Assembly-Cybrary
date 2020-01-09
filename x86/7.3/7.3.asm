%include "asm_io.inc"
%stacksize flat
segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push 3
	push 5
	push 7
	call bar
	add esp, 0Ch
	call print_int
	call print_nl	
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
bar: 
	%arg x:dword, y:byte, z:dword
	enter 0,0
	mov eax, [x]
	mov ebx, [y]
	mov ecx,[z]
	add eax, ebx
	add eax, ecx
	leave
	ret
	
