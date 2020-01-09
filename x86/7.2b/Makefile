all: 7.2b
7.2b: 7.2b.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

7.2b.o: 7.2b.asm 
	nasm -f elf 7.2b.asm -o 7.2b.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 7.2b *.o
