all: first 
 
first: first.o lib.o
	gcc -o $@ $+
 
first.o : first.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf first *.o

