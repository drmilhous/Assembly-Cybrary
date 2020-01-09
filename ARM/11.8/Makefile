all: 11.8 
 
11.8: 11.8.o lib.o
	gcc -o $@ $+
 
11.8.o : 11.8.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 11.8 *.o

