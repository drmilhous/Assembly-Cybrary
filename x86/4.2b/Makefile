all: 4.2b
4.2b: 4.2b.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

4.2b.o: 4.2b.asm 
	nasm -f elf 4.2b.asm -o 4.2b.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 4.2b *.o
