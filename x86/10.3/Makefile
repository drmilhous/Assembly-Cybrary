all: 10.3
10.3: 10.3.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

10.3.o: 10.3.asm 
	nasm -f elf 10.3.asm -o 10.3.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 10.3 *.o
