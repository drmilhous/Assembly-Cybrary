all: 6.5
6.5: 6.5.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

6.5.o: 6.5.asm 
	nasm -f elf 6.5.asm -o 6.5.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 6.5 *.o
