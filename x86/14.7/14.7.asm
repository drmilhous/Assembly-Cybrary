%include "asm_io.inc"
segment .data 
text: db "Enter the day of the month:", 0
p1: db "Person A", 10, 0
p2: db "Person B", 10, 0
p3: db "Person C", 10, 0
other: db "None", 10, 0
segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, text
	call print_string
	call read_int

	mov ecx, 3
	mov edx, 0
	div ecx

	mov ecx, edx; modulus
	cmp ecx, 3;
	jge defaulter

	mov ebx, table
	mov eax, 4
	mul ecx
	add ebx, eax
	jmp [ebx]

	
table: 	dd x
	dd y
	dd z

x:
	mov eax, p1
	jmp done
y:
	mov eax, p2
	jmp done
z:
	mov eax, p3
	jmp done


defaulter:
	mov eax, other

done:
	call print_string
	call print_nl
 	
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
