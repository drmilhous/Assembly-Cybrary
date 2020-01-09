all: Indexing 
 
Indexing: Indexing.o lib.o
	gcc -o $@ $+
 
Indexing.o : Indexing.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf Indexing *.o

