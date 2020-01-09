%include "asm_io.inc"
segment .data 

msg: db "Hello World! rax=>%016LX", 10,0
segment .bss 

segment .text
        global main
	extern printf
	extern fred
main:
        enter   0,0               ; setup routine
	lea rax, [fred wrt ..got]
       	mov rsi,[rax]
	mov rdi, msg
	mov rax, 0
	call printf WRT ..plt 
	mov rax, 0            ; return back to C
        leave                     
        ret
