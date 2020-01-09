all: bigMul 
 
bigMul: bigMul.o lib.o
	gcc -mfpu=neon-vfpv4 -o $@ $+
 
bigMul.o : bigMul.asm 
	as -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf bigMul *.o

