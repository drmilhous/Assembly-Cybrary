#include <stdio.h>
int main()
{
	extern int fred;
	printf("%08x\n", fred);

}
