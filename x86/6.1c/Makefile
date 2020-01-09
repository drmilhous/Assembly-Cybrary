all: 6.1c
6.1c: 6.1c.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

6.1c.o: 6.1c.asm 
	nasm -f elf 6.1c.asm -o 6.1c.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 6.1c *.o
