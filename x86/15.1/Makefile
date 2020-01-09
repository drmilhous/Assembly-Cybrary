all: 15.1
15.1: 15.1.o 
	gcc -o $@ $+

15.1.o: 15.1.asm 
	nasm -f elf64 15.1.asm -o 15.1.o

clean:
	rm 15.1 *.o
