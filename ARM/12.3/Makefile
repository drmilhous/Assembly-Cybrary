all: 12.3 
 
12.3: 12.3.o lib.o
	gcc  -mfpu=neon-vfpv4 -o $@ $+
 
12.3.o : 12.3.asm 
	as  -mfpu=neon-vfpv4 -o $@ $<

lib.o: lib.asm
	as  -o lib.o lib.asm
 
clean:
	rm -vf 12.3 *.o

