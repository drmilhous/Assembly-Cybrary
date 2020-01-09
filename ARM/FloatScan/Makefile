all: FloatScan 
 
FloatScan: FloatScan.o lib.o
	gcc  -mfpu=neon-vfpv4 -o $@ $+
 
FloatScan.o : FloatScan.asm 
	as  -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as  -o lib.o lib.asm
 
clean:
	rm -vf FloatScan *.o

