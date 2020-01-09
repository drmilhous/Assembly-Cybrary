all: 12-4 
 
12-4: 12-4.o lib.o
	gcc -mfpu=neon-vfpv4 -o $@ $+
 
12-4.o : 12-4.asm 
	as -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 12-4 *.o

