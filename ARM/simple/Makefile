all: simple 
 
simple: simple.o lib.o
	gcc -o $@ $+
 
simple.o : simple.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf simple *.o

