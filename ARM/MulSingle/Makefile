all: MulSingle 
 
MulSingle: MulSingle.o lib.o
	gcc  -mfpu=neon-vfpv4 -o $@ $+
 
MulSingle.o : MulSingle.asm 
	as  -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as  -o lib.o lib.asm
 
clean:
	rm -vf MulSingle *.o

