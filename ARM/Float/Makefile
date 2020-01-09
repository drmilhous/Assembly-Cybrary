all: Float 
 
Float: Float.o lib.o
	gcc -mfpu=neon-vfpv4 -o $@ $+
 
Float.o : Float.asm 
	as -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf Float *.o

