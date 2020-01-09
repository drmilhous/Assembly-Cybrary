%include "asm_io.inc"
segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	call read_int
	mov ebx, eax
	mov eax, 1
compare:cmp eax, ebx
	jg done
	call print_int
	call print_nl
	inc eax
	jmp compare
done:		
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
