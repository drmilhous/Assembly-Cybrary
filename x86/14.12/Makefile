all: 14.12
14.12: 14.12.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

14.12.o: 14.12.asm 
	nasm -f elf 14.12.asm -o 14.12.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 14.12 *.o
