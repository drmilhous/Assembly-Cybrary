all: 9.1
9.1: 9.1.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

9.1.o: 9.1.asm 
	nasm -f elf 9.1.asm -o 9.1.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 9.1 *.o
