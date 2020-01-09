all: 11 
 
11: 11.o lib.o
	gcc -o $@ $+
 
11.o : 11.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 11 *.o

