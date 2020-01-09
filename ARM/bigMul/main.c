#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <stdio.h>
#include <stdlib.h>

long long max(long long l, long long m)
{
	long long temp = 1;
	temp = l * m;
	return temp;
}

int mainX(int argc, int argv)
{
	double f1 = -1;
	double f2 = -2;
	scanf("%lf %lf", &f1, &f2);

	printf("%lf %lf %lf\n",f1,f2);	
}
int main(int argc, char ** argv, char ** envp)
{

	long long l = 100;
	long long m = 500;
	long long n = 0xFF;
	
	l = max(l, (long long )argc);
	
	n = m * l;
}
