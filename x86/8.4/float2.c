#include <stdio.h>
#include <stdlib.h>

int main()
{
	float x;
	scanf("%f", &x); 
	if (x == 100.1)
	{
		printf("Good %lf\n", x);
	}
	else
	{
		printf("Bad %lf\n", x);
	}
}
