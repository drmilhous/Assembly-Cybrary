all: syscall
syscall: syscall.o 
	gcc  -o $@ $+ $(HOME)/templateMake/driver.c

syscall.o: syscall.asm 
	nasm -f elf64 syscall.asm -o syscall.o

asm_io.o: asm_io.asm 
	nasm -f elf64 -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm syscall *.o
