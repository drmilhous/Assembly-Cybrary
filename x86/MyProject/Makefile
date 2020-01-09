all: MyProject
MyProject: MyProject.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

MyProject.o: MyProject.asm 
	nasm -f elf MyProject.asm -o MyProject.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm MyProject *.o
