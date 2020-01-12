%include "io.inc"
segment .data 
global hello2:data hello2.end-hello2
hello2: dq 0FEEDBEEFBEEFFEEDh 
.end:
segment .bss 
global  hello:data 4      ; give the size too 

hello:  resd    1 
.end:
segment .text
        global  asm_main:function
asm_main:
        enter   0,0               ; setup routine
	;***************CODE STARTS HERE***************************
	mov rax, hello wrt ..sym
	mov DWORD [rax], 0BEEFFADEh			
	mov rax, hello2 wrt ..sym
	mov BYTE [rax+6], 0h			
	;***************CODE ENDS HERE*****************************
        mov     eax, 0            ; return back to C
        leave                     
        ret
