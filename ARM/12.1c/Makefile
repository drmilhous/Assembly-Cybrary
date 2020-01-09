all: 12.1 
 
12.1: 12.1.o lib.o
	gcc -mfpu=neon-vfpv4 -o $@ $+
 
12.1.o : 12.1.asm 
	#as -mfpu=vfpv2 -o $@ $<
	as -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 12.1 *.o

