#include <stdio.h>
#include <stdlib.h>
static float x;
int main()
{
	x  = 99.9;
	scanf("%f", &x);
	float y = 1.234;
	if (x >= y)
	{
		printf("The value is %lf", x);
	}
}
