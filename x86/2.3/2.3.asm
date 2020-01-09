%include "asm_io.inc"
segment .data 
prompt db "Please Enter a number:", 0
result db "The result is :", 0
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, prompt
	call print_string
	call read_int
	mov ebx, eax; number 1 in ebx
	
	mov eax, prompt
	call print_string
	call read_int
	mov ecx, eax; number 2 in ecx
	
	mov eax,result 
	call print_string 
	mov eax, ecx
	add eax, ebx
	call print_int
	call print_nl
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
