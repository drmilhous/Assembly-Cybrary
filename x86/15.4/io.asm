;RDI, RSI, RDX, RCX, R8, R9 (R10) XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6 and XMM7 are used for the first floating point arguments.
segment .data
printInt: db "%d",0
printNewline: db 10,0
printString: db "%s",0
Registerdump db "RAX = 0x%016LX RBX = 0x%016LX "
             db "RCX = 0x%016LX RDX = 0x%016LX ", 10
             db "RSI = 0x%016LX RDI = 0x%016LX "
             db "R8  = 0x%016LX R9  = 0x%016LX ", 10
             db "R10 = 0x%016LX R11 = 0x%016LX "
             db "R12 = 0x%016LX R13 = 0x%016LX ", 10
             db "R14 = 0x%016LX R15 = 0x%016LX "
             db "RBP = 0x%016LX RSP = 0x%016LX ", 10,10,  0
extern printf

segment .text 
global print_int 
global print_nl
global print_string
global dump_regs

dump_regs:
	push rbp
	mov rbp, rsp	
	
	push rax ; RBP -8	
	push rbx ; -10h
	push rcx ; -18h
	push rdx ; -20h
	push rsi; -28h
	push rdi; -30h
	push r8; -38h
	push r9; -40h

	mov r8, rbp
	add r8, 10h ; 8 rbp 8 return address
	push r8 ; rsp
	mov r8, [rbp]
	push r8 ; rbp
	
	push r15; 14
	push r14; 13
	push r13; 12
	push r12; 11
	push r11; 10
	push r10; 9
	
	mov r8, [rbp - 40h]
 	push r8	; 8 r9
	mov r8, [rbp - 38h]
	push r8	; 7 r8
	mov r8, [rbp - 30h]
	push r8	; 6 rdi
	mov r8, [ rbp - 28h]
	push r8; 5 rsi

	mov r8,  rdx; 4
	mov rcx, rcx; 3
	mov rdx, rbx; 2
	mov rsi, rax; 1
	mov rdi, Registerdump
	mov rax, 0
	call printf wrt ..plt
	add rsp, 8 * 4

	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	
	add rsp, 10h
	
	pop r9
	pop r8
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop rbx
	pop rax

	
	mov rsp, rbp
	pop rbp
	ret

print_int:
	push rax
	push rsi
	push rdi
	mov rsi, rax
	mov rax, 0x0 ; xmm
	mov rdi, printInt
	call printf
	pop rdi
	pop rsi
	pop rax
	ret
print_nl:
	push rax
	push rsi
	push rdi
	mov rdi, printNewline
	call printf
	pop rdi
	pop rsi
	pop rax
	ret
print_string:
	push rax
	push rsi
	push rdi
	mov rsi, rax
	mov rdi, printString
	call printf
	pop rdi
	pop rsi
	pop rax
	ret
