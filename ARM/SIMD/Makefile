all: SIMD 
 
SIMD: SIMD.o lib.o
	gcc  -mfpu=neon-vfpv4 -o $@ $+
 
SIMD.o : SIMD.asm 
	as  -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf SIMD *.o

