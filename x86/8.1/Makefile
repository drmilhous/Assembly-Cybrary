all: 8.1
8.1: 8.1.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

8.1.o: 8.1.asm 
	nasm -f elf 8.1.asm -o 8.1.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 8.1 *.o
