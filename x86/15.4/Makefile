all: 15.4
15.4: 15.4.o io.o
	gcc -o $@ $+ $(HOME)/templateMake/driver64.c

15.4.o: 15.4.asm 
	nasm -f elf64 15.4.asm -o 15.4.o

io.o: io.asm 
	nasm -f elf64 -d ELF_TYPE io.asm -o io.o

clean:
	rm 15.4 *.o
