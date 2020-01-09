all: 4.1b
4.1b: 4.1b.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

4.1b.o: 4.1b.asm 
	nasm -f elf 4.1b.asm -o 4.1b.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 4.1b *.o
