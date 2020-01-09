segment .data 
text db "Testing %016LX", 10,0
myQWord dq 0xFEEDBEEFBEEFFEED
segment .bss 
segment .text
        global  main
	extern printf
main:
        enter   0,0               ; setup routine
	;***************CODE STARTS HERE***************************
	mov rsi, [myQWord]
	mov rdi, text	
	mov rax, 0
	call printf WRT ..plt
	;***************CODE ENDS HERE*****************************
        mov     eax, 0            ; return back to C
        leave                     
        ret
