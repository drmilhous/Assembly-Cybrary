all: SIMD-2 
 
SIMD-2: SIMD-2.o lib.o
	gcc -mfpu=neon-vfpv4 -o $@ $+
 
SIMD-2.o : SIMD-2.asm 
	as -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf SIMD-2 *.o

