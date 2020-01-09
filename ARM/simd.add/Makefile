all: simd.add 
 
simd.add: simd.add.o lib.o
	gcc -mfpu=neon-vfpv4  -o $@ $+
 
simd.add.o : simd.add.asm 
	as -mfpu=neon-vfpv4  -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf simd.add *.o

