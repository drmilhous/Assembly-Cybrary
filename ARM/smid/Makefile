all: smid 
 
smid: smid.o lib.o
	gcc -mfpu=neon-vfpv4 -o $@ $+
 
smid.o : smid.asm 
	as -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf smid *.o

