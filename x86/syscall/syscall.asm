%include "asm_io.inc"
segment .data 
hello: db "Hello",10,0
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
	;***************CODE STARTS HERE***************************
	mov qword rax, 1 ;syscall number 4 = write
	mov qword rdi, 1 ;std out
	mov qword rsi, hello
	mov qword rdx, 7 ; number of characters
	syscall 
	;int 80h
	;***************CODE ENDS HERE*****************************
        mov     eax, 0            ; return back to C
        leave                     
        ret
