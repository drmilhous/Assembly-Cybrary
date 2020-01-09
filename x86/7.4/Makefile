all: 7.4
7.4: 7.4.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

7.4.o: 7.4.asm 
	nasm -f elf 7.4.asm -o 7.4.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 7.4 *.o
