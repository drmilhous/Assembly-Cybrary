all: Hello
Hello: Hello.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

Hello.o: Hello.asm 
	nasm -f elf Hello.asm -o Hello.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm Hello *.o
