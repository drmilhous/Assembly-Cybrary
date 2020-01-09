%include "asm_io.inc"
segment .data 
fred db "Testing 123!",0
sformat db "%s",0
segment .bss 
a resb 100
ted resb 20


segment .text
        global  asm_main
	extern scanf
	extern strlen
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, a
	push eax
	push sformat
	call scanf
	add esp, 8

	mov edi, a
	mov ecx, -1 ; set ecx to run
	cld ; set scan forward
	mov al, 0 ; set the condition (look for null)
	repne scasb ; look for null
	mov eax, edi ;get where scasb ended
	sub eax, a; subtract base address
	dec eax ; subtract the null

	call print_int
	call print_nl
	
	mov eax, a
	push eax
	call strlen
	add esp, 4
	

	call print_int
	call print_nl
	
	mov esi, fred
	mov edi, ted
	cld
	mov ecx, 20
	
copy:
	lodsb
	stosb
	loop copy
	
	mov eax, ted
	call print_string
	call print_nl		
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
