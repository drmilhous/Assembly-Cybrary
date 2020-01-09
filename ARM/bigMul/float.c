#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char ** argv, char ** envp)
{
	double a = 100;
	double b = 200;
	double c = a * b;
	double d = a / b;
	printf("%lf %lf %lf", c,d, a);
}
