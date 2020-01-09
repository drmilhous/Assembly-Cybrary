all: 11.3 
 
11.3: 11.3.o lib.o
	gcc -o $@ $+
 
11.3.o : 11.3.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 11.3 *.o

