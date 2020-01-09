#include <stdlib.h>
#include <stdio.h>
#include <string.h>
typedef union myUnion{
	float f;
	unsigned char t[6];
} myUnion;
int main(int argc, char ** argv, char ** envp)
{
	union myUnion x;
	for(int i = 0; i < 6; i++)
	{
		x.t[i] = 0xFF;
	} 
	x.f = 3.14;
	for(int i = 0; i < 6; i++)
	{
		printf("0x%X\n", x.t[i]);
	} 
}
