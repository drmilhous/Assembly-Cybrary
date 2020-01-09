all: fred 
 
fred: fred.o lib.o
	gcc -o $@ $+
 
fred.o : fred.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf fred *.o

