#include <stdio.h>
#include <stdlib.h>

double maxf(double x, double y)
{
	double result = -1.0;
	double temp = x * 2.0;
	if(temp > y)
	{
		result  = temp;
	}
	else if (x > y)
	{
		result = x;
	}
	else
	{
		result = y;
	}
	return result;

}

int main(int argc, int argv)
{
	double f1 = -1;
	double f2 = -2;
	scanf("%lf %lf", &f1, &f2);
	double max = maxf(f1,f2);	
	printf("%lf %lf %lf\n",f1,f2,max);	
}

	
