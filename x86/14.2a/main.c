#include <stdlib.h>
#include <stdio.h>
#include <string.h>
typedef struct myStruct{
	char c;
	long l;
	char d;
} myStruct;
int main(int argc, char ** argv, char ** envp)
{
	struct myStruct s;
	s.c = 'a';
	s.l = 100l;
	s.d  = 0xFF;
}
