all: 5.3
5.3: 5.3.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

5.3.o: 5.3.asm 
	nasm -f elf 5.3.asm -o 5.3.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm 5.3 *.o
