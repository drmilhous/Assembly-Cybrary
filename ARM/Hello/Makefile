all: Hello 
 
Hello: Hello.o lib.o
	gcc -o $@ $+
 
Hello.o : Hello.asm 
	as  -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf Hello *.o

