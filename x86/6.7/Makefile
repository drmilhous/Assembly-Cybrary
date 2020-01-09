all: 6.7
6.7: 6.7.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

6.7.o: 6.7.asm 
	nasm -f elf 6.7.asm -o 6.7.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 6.7 *.o
