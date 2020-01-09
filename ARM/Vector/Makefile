all: Vector 
 
Vector: Vector.o lib.o
	gcc -mfpu=neon-vfpv4 -o $@ $+
 
Vector.o : Vector.asm 
	as -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf Vector *.o

