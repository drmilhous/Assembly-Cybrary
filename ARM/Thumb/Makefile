all: Thumb 
 
Thumb: Thumb.o lib.o
	gcc -o $@ $+
 
Thumb.o : Thumb.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf Thumb *.o

