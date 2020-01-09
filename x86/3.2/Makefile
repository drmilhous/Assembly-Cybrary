all: 3.2
3.2: 3.2.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

3.2.o: 3.2.asm 
	nasm -f elf 3.2.asm -o 3.2.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 3.2 *.o
