all: 11.10 
 
11.10: 11.10.o lib.o
	gcc -o $@ $+
 
11.10.o : 11.10.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 11.10 *.o

