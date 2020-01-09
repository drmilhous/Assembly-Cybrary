all: A 
 
A: A.o lib.o
	gcc -o $@ $+
 
A.o : A.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf A *.o

