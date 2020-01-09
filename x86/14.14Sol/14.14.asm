%include "asm_io.inc"
segment .data 
c: db "Child Done", 10,0
p: db "Parent Done", 10,0
format: db "Child PID %d", 10,0
segment .bss 

segment .text
        global  asm_main
	extern printf
	extern sleep
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, 2; system call number for fork
	int 80h
	cmp eax, 0
	jnz parent
	jz child

child:
	push 3 ; seconds to sleep
	call sleep
	add esp, 4
	mov eax, c
	call print_string
	jmp done
parent:
	push eax
	mov eax, format
	push eax
	call printf
	add esp, 4
	pop ebx     ; pi to wait for
	sub esp, 8  ; stack space
	mov ecx, esp; pointer to stack
	mov edx, 0  ; options 
	mov eax, 7  ; syscall id for waitpid
	int 80h
	add esp, 8
	
	mov eax, p
	call print_string
	jmp done
done:		
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
