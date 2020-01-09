all: int80
int80: int80.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

int80.o: int80.asm 
	nasm -f elf int80.asm -o int80.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm int80 *.o
