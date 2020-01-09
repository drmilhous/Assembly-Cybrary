all: 64-bit-printf
64-bit-printf: 64-bit-printf.o
	gcc -o $@ $+

64-bit-printf.o: 64-bit-printf.asm 
	nasm -f elf64 64-bit-printf.asm -o 64-bit-printf.o


clean:
	rm 64-bit-printf *.o
