all: 10.4
10.4: 10.4.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

10.4.o: 10.4.asm 
	nasm -f elf 10.4.asm -o 10.4.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 10.4 *.o
