#include <stdlib.h>
#include <stdio.h>
#include <string.h>
typedef struct myStruct{
	float f;
	char c;
	int d;
	unsigned char t[6];
} myStruct;
int main(int argc, char ** argv, char ** envp)
{
	struct myStruct s;
	s.f = 3.1;
	s.c = 'a';
	s.d = 255;
	s.t[0] = 'b'; 
	s.t[1] = 0;
}
