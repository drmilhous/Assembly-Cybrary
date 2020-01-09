all: 2.1
2.1: 2.1.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

2.1.o: 2.1.asm 
	nasm -f elf 2.1.asm -o 2.1.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 2.1 *.o
