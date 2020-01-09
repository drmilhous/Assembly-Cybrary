all: jay 
 
jay: jay.o lib.o
	gcc -o $@ $+
 
jay.o : jay.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf jay *.o

