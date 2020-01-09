all: Store 
 
Store: Store.o lib.o
	gcc -o $@ $+
 
Store.o : Store.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf Store *.o

