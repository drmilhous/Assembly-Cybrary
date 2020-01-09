%include "asm_io.inc"
segment .data 
hello: db "Hello",10,0
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, 4 ;syscall number 4 = write
	mov ebx, 1 ;std out
	mov ecx, hello
	mov edx, 7 ; number of characters
	;syscall 
	int 80h
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
