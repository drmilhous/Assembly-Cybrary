all: 12-2 
 
12-2: 12-2.o lib.o
	gcc -mfpu=neon-vfpv4 -o $@ $+
 
12-2.o : 12-2.asm 
	as -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 12-2 *.o

