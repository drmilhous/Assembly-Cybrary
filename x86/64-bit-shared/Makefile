all: 64-bit-shared
64-bit-shared: 64-bit-shared.o lib.so 
	gcc -o $@ $+

64-bit-shared.o: 64-bit-shared.asm 
	nasm -f elf64 64-bit-shared.asm -o 64-bit-shared.o

lib.so: lib.c
	gcc -fPIC -shared -o lib.so  $+

clean:
	rm 64-bit-shared *.o
