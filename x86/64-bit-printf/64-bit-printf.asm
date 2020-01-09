segment .data 
msg: db "Hello World! rax=>%016LX", 10,0
;https://stackoverflow.com/questions/32112497/how-to-printf-a-64-bit-integer-as-hex
segment .bss 

segment .text
        global  main
	extern printf
	extern fred
main:
        enter   0,0               ; setup routine
	;***************CODE STARTS HERE***************************
	mov rsi, [fred]
	mov rdi, msg
	mov rax, 0
	call printf WRT ..plt
	
	;***************CODE ENDS HERE*****************************
        mov     eax, 0            ; return back to C
        leave                     
        ret
