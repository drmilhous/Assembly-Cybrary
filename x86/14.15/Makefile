all: 14.15
14.15: 14.15.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

14.15.o: 14.15.asm 
	nasm -f elf 14.15.asm -o 14.15.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 14.15 *.o
