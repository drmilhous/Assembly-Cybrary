%include "asm_io.inc"
segment .data 
ls: db "/bin/ls"
struc myStat
	.st_mode:  	resd 1
	.st_ino:	resd 1
	.st_dev:	resq 1
	.st_rdev:	resq 1
	.st_nlink:	resd 1
	.st_uid:	resd 1
	.st_gid:	resd 1
	.st_size:	resd 1
	.st_atim:	resq 1
	.st_mtim:	resq 1
	.st_ctim:	resq 1
	.st_blksize:	resd 1
	.st_blocks:	resd 1
endstruc
segment .bss 

segment .text
        global  asm_main
	extern stat
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	push 0FFFFFFFFh
	push 0FFFFFFFFh
	push 0FFFFFFFFh
	push 0FFFFFFFFh
	sub esp, 80	
	mov eax, esp
	sub esp, 8
	push eax
	mov eax, ls
	push eax
	call stat
	add esp, 10h		
	mov eax, [esp + myStat.st_ino]
	mov ebx, [esp + myStat.st_blksize]
	mov ecx, [esp + myStat.st_blocks]
	mov edx, [esp + myStat.st_size]
	dump_regs 1
	add esp, 80
	add esp, 10h
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
