all: VectorScalar 
 
VectorScalar: VectorScalar.o lib.o
	gcc  -mfpu=neon-vfpv4 -o $@ $+
 
VectorScalar.o : VectorScalar.asm 
	as  -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf VectorScalar *.o

