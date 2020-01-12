all: shared
shared: liba.so
	gcc -I. -L. main.c -la -o main.out

liba.so: liba.o io.o
	gcc -fPIC -shared -o liba.so io.o liba.o

liba.o: shared.asm 
	nasm -f elf64 shared.asm -o liba.o

io.o: io.asm 
	nasm -f elf64 io.asm -o io.o

clean:
	rm main.out liba.so *.o
